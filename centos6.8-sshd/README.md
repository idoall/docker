# 目录

[TOC]

# Docker-SSHD-Centos/6.8


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`centos:6.8`](https://hub.docker.com/r/idoall/centos/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd centos6.8-sshd

# hack hack hack

# build
docker build -t idoall/centos6.8-sshd:latest .

# run
docker run -it \
--rm \
--name sshd \
--hostname sshd \
-p 2222:2222 \
idoall/centos6.8-sshd:latest


# access the contain
docker exec -it sshd /bin/bash


# ssh  user:work   password:123456
ssh work@<your ip> -p 2222

```