# docker-ubuntu16.04


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`ubuntu:16.04`](https://hub.docker.com/r/library/ubuntu/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu/16.04

# hack hack hack

# build
docker build -t idoall/ubuntu:16.04 .

# run
docker run -it \
--rm \
--name ubuntu16 \
--hostname ubuntu16 \
idoall/ubuntu:16.04 \
/bin/bash


# view supervisor version
docker exec -it ubuntu16 supervisord -v


# access the contain
docker exec -it ubuntu16 /bin/bash

```