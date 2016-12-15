
golang1.7.4-docker
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`library/alpine`](https://hub.docker.com/r/library/alpine/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker-golang1.7.4-base.git
cd docker-golang1.7.4-base

# hack hack hack

# Build
docker build -t idoall/centos7-golang-revel .

# Run
docker run -it --name=golang idoall/golang-1.7.4-base /bin/bash
```
