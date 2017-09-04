
golang1.9-docker
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/golang:1.4`](https://hub.docker.com/r/idoall/golang:1.4/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.9

# hack hack hack

# Build
docker build -t idoall/golang:1.9 .

# view version
docker run -it --name=golang --rm idoall/golang:1.9 go version

# Run
docker run -it --name=golang idoall/golang:1.9 /bin/bash
```
