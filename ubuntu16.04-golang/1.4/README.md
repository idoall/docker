
docker-ubuntu16.04-golang1.4
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/ubuntu:16.04`](https://hub.docker.com/r/idoall/ubuntu/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-golang/1.4

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-golang:1.4 .

# view version
docker run -it --name=golang --rm idoall/ubuntu16.04-golang:1.4 go version

# Run
docker run -d --name=golang idoall/ubuntu16.04-golang:1.4

# access the contain
docker exec -it golang /bin/bash
```
