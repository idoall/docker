# docker-ubuntu20.04


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`ubuntu:20.04`](https://hub.docker.com/r/library/ubuntu/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu/20.04/source

# hack hack hack

# build
docker build -t idoall/ubuntu:20.04-source .

# run
docker run -it \
--rm \
--name ubuntu20 \
--hostname ubuntu20 \
idoall/ubuntu:20.04-source \
/bin/bash


# view supervisor version
docker run -it --rm --name ubuntu20 idoall/ubuntu:20.04-source supervisord -v


# deamon contain
docker run -d \
--name ubuntu20 \
--hostname ubuntu20 \
idoall/ubuntu:20.04-source

# access the contain
docker exec -it ubuntu20 /bin/bash

```