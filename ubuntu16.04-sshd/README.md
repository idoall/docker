# 目录

[TOC]

# Docker-SSHD-Ubuntu/16.04


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`ubuntu:16.04`](https://hub.docker.com/r/idoall/ubuntu/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-sshd

# hack hack hack

# build
docker build -t idoall/ubuntu16.04-sshd .

# run
docker run -d \
--name sshd \
--hostname sshd \
-p 2222:2222 \
idoall/ubuntu16.04-sshd


# access the contain
docker exec -it sshd /bin/bash


# ssh  user:work   password:123456
ssh work@<your ip> -p 2222

```