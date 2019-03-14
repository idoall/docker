package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "80"
	}

	fmt.Fprintf(os.Stdout, "Listening on :%s\n", port)
	hostname, _ := os.Hostname()
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(os.Stdout, "I'm %s\n", hostname)
		fmt.Fprintf(w, "[mshk.top]I'm %s\n", hostname)
	})

	log.Fatal(http.ListenAndServe(":"+port, nil))
}
