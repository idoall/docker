package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"

	"github.com/idoall/docker/snowflake"
)

type UserData struct {
	ServerId int `json:"server-id"`
}

type Options struct {
	ServerID int
	Port     int
}

func main() {
	var (
		flagServerID = flag.Int("id", 0, "unique server id")
		flagPort     = flag.Int("port", 7006, "port to list on")
	)
	flag.Parse()

	opts := Options{
		ServerID: *flagServerID,
		Port:     *flagPort,
	}

	if s := os.Getenv("PORT"); s != "" {
		v, err := strconv.Atoi(s)
		if err != nil {
			log.Fatalln("Unable to parse PORT env variable -", err)
		}
		opts.Port = v
	}

	if s := os.Getenv("SERVER_ID"); s != "" {
		v, err := strconv.Atoi(s)
		if err != nil {
			log.Fatalln("Unable to parse SERVER_ID env variable -", err)
		}
		opts.ServerID = v
	}

	Run(opts)
}

func Run(opts Options) {
	serverID := opts.ServerID

	handler := snowflake.Multi(serverID, 512)
	http.ListenAndServe(fmt.Sprintf(":%v", opts.Port), handler)
}
