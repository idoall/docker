package snowflake

import (
	"context"
	"fmt"
	"math/rand"
	"os"
	"sync"
	"time"
)

const (
	defaultRequestSize = 512
)

// BufferedClient implements a client that internally buffers ids for performance purposes
type BufferedClient struct {
	client     Client
	ch         chan int64
	ctx        context.Context
	cancel     func()
	wg         *sync.WaitGroup
	bufferSize int
	workers    int
}

func (c *BufferedClient) Id() int64 {
	return <-c.ch
}

func (c *BufferedClient) spawnN(n int) {
	c.wg.Add(n)
	for i := 0; i < n; i++ {
		go c.spawn()
	}
}

func (c *BufferedClient) spawn() {
	defer c.wg.Done()

	requestSize := defaultRequestSize
	if requestSize > c.bufferSize {
		requestSize = c.bufferSize
	}

	for {
		ctx, _ := context.WithTimeout(context.Background(), time.Second*3)
		ids, err := c.client.IntN(ctx, requestSize)
		if err != nil {
			select {
			case <-c.ctx.Done():
				return
			default:
			}

			// if there was a problem, hang out for a little bit before trying again
			fmt.Fprintln(os.Stderr, err)
			time.Sleep(250*time.Millisecond + time.Duration(rand.Intn(100))*time.Millisecond)
			continue
		}

		for _, id := range ids {
			select {
			case c.ch <- id:
			case <-c.ctx.Done():
				return
			}
		}
	}
}

func (c *BufferedClient) Close() {
	c.cancel()
	c.wg.Wait()
}

func NewBufferedClient(c Client, opts ...BufferedClientOption) *BufferedClient {
	ctx, cancel := context.WithCancel(context.Background())
	bc := &BufferedClient{
		ctx:        ctx,
		cancel:     cancel,
		client:     c,
		wg:         &sync.WaitGroup{},
		bufferSize: 4096,
		workers:    8,
	}

	for _, opt := range opts {
		opt(bc)
	}

	bc.ch = make(chan int64, bc.bufferSize)

	bc.spawnN(bc.workers)

	return bc
}

// BufferedClientOption defines options to the NewBufferedClient variable
type BufferedClientOption func(client *BufferedClient)

// WithBufferSize specifies the number of ids that may be buffered locally; beware, the larger you make this, the longer
// the startup will take
func WithBufferSize(n int) BufferedClientOption {
	max := 65384

	return func(client *BufferedClient) {
		if n < 1 || n > max {
			panic(fmt.Sprintf("WithBufferSize must be between 1 and %v", max))
		}

		client.bufferSize = n
	}
}

// WithWorkers specifies the number of concurrent goroutines that will be fetching ids
func WithWorkers(n int) BufferedClientOption {
	max := 100

	return func(client *BufferedClient) {
		if n < 1 || n > max {
			panic(fmt.Sprintf("WithBufferSize must be between 1 and %v", max))
		}
		client.workers = n
	}
}
