# 目录

[TOC]

Docker-Centos/6.8-golang/1.4
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/centos:6.8`](https://hub.docker.com/r/idoall/centos/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd centos6.8-golang/1.4

# hack hack hack

# Build
docker build -t idoall/centos6.8-golang:1.4 .

# view version
docker run -it --name=golang --rm idoall/centos6.8-golang:1.4 go version

# Run
docker run -d --name=golang idoall/centos6.8-golang:1.4

# access the contain
docker exec -it golang /bin/bash
```
