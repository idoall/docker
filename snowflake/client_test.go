package snowflake

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHttpFactory(t *testing.T) {
	maxN := 512
	handler := makeHandler(Mock, maxN)
	router := http.NewServeMux()
	router.Handle("/10/13", handler)

	fn := func(req *http.Request) (*http.Response, error) {
		recorder := httptest.NewRecorder()
		router.ServeHTTP(recorder, req)
		return recorder.Result(), nil
	}

	remoteFactory, err := NewClient(WithDoFunc(fn))
	if err != nil {
		t.Error("Unable to create HttpFactory")
	}

	client := NewBufferedClient(remoteFactory)

	uniques := map[int64]int64{}
	iterations := maxN * 32
	for i := 0; i < iterations; i++ {
		id := client.Id()
		uniques[id] = id
	}
	client.Close()

	if v := len(uniques); v != iterations {
		t.Errorf("expected %v; got %v\n", iterations, v)
	}
}
