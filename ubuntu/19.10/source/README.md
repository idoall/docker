# docker-ubuntu19.10


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`ubuntu:19.10`](https://hub.docker.com/r/library/ubuntu/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu/19.10/source

# hack hack hack

# build
docker build -t idoall/ubuntu:19.10-source .

# run
docker run -it \
--rm \
--name ubuntu19 \
--hostname ubuntu19 \
idoall/ubuntu:19.10-source \
/bin/bash


# view supervisor version
docker run -it --rm --name ubuntu19 idoall/ubuntu:19.10-source supervisord -v


# deamon contain
docker run -d \
--name ubuntu19 \
--hostname ubuntu19 \
idoall/ubuntu:19.10-source

# access the contain
docker exec -it ubuntu19 /bin/bash

```