# 目录

[TOC]

# Docker-Centos/7.6


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`centos:7.6`](https://hub.docker.com/_/centos)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd centos/7.6

# hack hack hack

# build
docker build -t idoall/centos:7.6 .

# run
docker run -it \
--rm \
--name centos \
--hostname centos \
idoall/centos:7.6


# view supervisor version
docker exec -it centos supervisord -v


# access the contain
docker exec -it centos /bin/bash

```