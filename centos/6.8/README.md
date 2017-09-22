# 目录

[TOC]

# Docker-Centos/6.8


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`centos:6.8`](https://hub.docker.com/r/library/centos/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd centos/6.8

# hack hack hack

# build
docker build -t idoall/centos:6.8 .

# run
docker run -it \
--rm \
--name centos \
--hostname centos \
idoall/centos:6.8


# view supervisor version
docker exec -it centos supervisord -v


# access the contain
docker exec -it centos /bin/bash

```