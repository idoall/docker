
golang1.4-docker
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/supervisor`](https://hub.docker.com/r/idoall/supervisor/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.4

# hack hack hack

# Build
docker build -t idoall/golang:1.4 .

# view version
docker run -it --name=golang --rm idoall/golang:1.4 go version

# Run
docker run -it --name=golang idoall/golang:1.4 /bin/bash
```
