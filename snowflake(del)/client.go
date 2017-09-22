package snowflake

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"os"
	"strconv"
	"sync/atomic"
)

// Client represents a ID generate
type Client interface {
	// IntN generates the N unique ids
	IntN(ctx context.Context, n int) ([]int64, error)
}

type client struct {
	hosts     []string
	hostCount int32
	offset    int32
	doFunc    func(r *http.Request) (*http.Response, error)
}

// IntN generates the N unique ids
func (c *client) IntN(ctx context.Context, n int) ([]int64, error) {
	host := c.hosts[int(c.offset%c.hostCount)]
	atomic.AddInt32(&c.offset, 1)
	if c.offset > c.hostCount {
		atomic.StoreInt32(&c.offset, 0)
	}

	url := host + "?n=" + strconv.Itoa(n)
	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return nil, err
	}
	req = req.WithContext(ctx)

	resp, err := c.doFunc(req)
	if err != nil {
		fmt.Fprintf(os.Stderr, err.Error())
		return nil, err
	}
	defer resp.Body.Close()

	var ids []int64
	err = json.NewDecoder(resp.Body).Decode(&ids)
	return ids, err
}

func NewClient(opts ...ClientOption) (Client, error) {
	h := &client{
		hosts:  []string{"http://snowflake.altairsix.com/10/13"},
		doFunc: http.DefaultClient.Do,
	}

	for _, opt := range opts {
		opt(h)
	}

	h.hostCount = int32(len(h.hosts))

	// ensure the hosts are all valid
	for _, host := range h.hosts {
		_, err := http.NewRequest("GET", host, nil)
		if err != nil {
			return nil, err
		}
	}

	return h, nil
}

type ClientOption func(*client)

func WithDoFunc(fn func(r *http.Request) (*http.Response, error)) ClientOption {
	return func(h *client) {
		h.doFunc = fn
	}
}

func WithHosts(hosts ...string) ClientOption {
	return func(h *client) {
		h.hosts = hosts
	}
}

func writeErr(w http.ResponseWriter, err error) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusBadRequest)
	json.NewEncoder(w).Encode(map[string]interface{}{
		"error": err.Error(),
	})
}

func makeHandler(factory *Factory, maxN int) http.HandlerFunc {
	return func(w http.ResponseWriter, req *http.Request) {
		req.ParseForm()

		n := 1
		if v := req.FormValue("n"); v != "" {
			var err error
			n, err = strconv.Atoi(v)
			if err != nil {
				writeErr(w, err)
				return
			}
			if n > maxN {
				writeErr(w, errors.New(fmt.Sprintf("exceeded the maximum number per request, %v", maxN)))
				return
			}
		}

		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		json.NewEncoder(w).Encode(factory.IdN(n))
	}
}

func info(serverID int) http.Handler {
	var handlerFunc http.HandlerFunc = func(w http.ResponseWriter, req *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		json.NewEncoder(w).Encode(map[string]int{
			"server-id": serverID,
		})
	}

	return handlerFunc
}

func Multi(serverID, nMax int) http.HandlerFunc {
	handlers := map[string]http.Handler{}

	for srv := 1; srv <= 13; srv++ {
		for seq := 0; seq <= 13; seq++ {
			if srv+seq+41 > 64 {
				continue
			}

			func(server, sequence int) {
				path := fmt.Sprintf("/%v/%v", srv, seq)
				factory := NewFactory(FactoryOptions{
					ServerID:     int64(serverID),
					ServerBits:   uint(server),
					SequenceBits: uint(sequence),
				})
				handlers[path] = makeHandler(factory, nMax)
			}(srv, seq)
		}
	}

	factory := NewFactory(FactoryOptions{
		ServerID: int64(serverID),
	})
	handlers["/"] = makeHandler(factory, nMax)
	handlers["/info"] = info(serverID)

	var handler http.HandlerFunc = func(w http.ResponseWriter, req *http.Request) {
		handler, ok := handlers[req.URL.Path]
		if !ok {
			w.WriteHeader(http.StatusNotFound)
			return
		}

		handler.ServeHTTP(w, req)
	}
	return handler
}
