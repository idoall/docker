# 目录

[TOC]

Docker-Centos/7.6-golang/1.12.9
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/centos:7.6`](https://hub.docker.com/r/idoall/centos/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd centos7.6-golang/1.12.9

# hack hack hack

# Build
docker build -t idoall/centos7.6-golang:1.12.9 .

# view version
docker run -it --name=golang --rm idoall/centos7.6-golang:1.12.9 go version

# Run
docker run -d --name=golang idoall/centos7.6-golang:1.12.9

# access the contain
docker exec -it golang /bin/bash
```
