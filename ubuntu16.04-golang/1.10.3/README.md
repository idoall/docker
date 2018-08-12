
docker-ubuntu16.04-golang1.10.3
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/ubuntu16.04-golang:1.4`](https://hub.docker.com/r/idoall/ubuntu16.04-golang/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd docker/ubuntu16.04-golang/1.10.3

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-golang:1.10.3 .

# view version
docker run -it --name=golang --rm idoall/ubuntu16.04-golang:1.10.3 go version

# Run
docker run -d --name=golang idoall/ubuntu16.04-golang:1.10.3

# access the contain
docker exec -it golang /bin/bash
```
