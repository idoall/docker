# docker-ubuntu16.04


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`ubuntu:16.04`](https://hub.docker.com/r/library/ubuntu/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu/18.04

# hack hack hack

# build
docker build -t idoall/ubuntu:18.04 .

# run
docker run -it \
--rm \
--name ubuntu18 \
--hostname ubuntu18 \
idoall/ubuntu:18.04 \
/bin/bash


# view supervisor version
docker run -it --rm --name ubuntu18 idoall/ubuntu:18.04 supervisord -v


# deamon contain
docker run -d \
--name ubuntu18 \
--hostname ubuntu18 \
idoall/ubuntu:18.04

# access the contain
docker exec -it ubuntu18 /bin/bash

```