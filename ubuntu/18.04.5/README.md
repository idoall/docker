# docker-ubuntu18.04.5


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`ubuntu:18.04.5`](https://hub.docker.com/r/library/ubuntu/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu/18.04.5

# hack hack hack

# build
docker build -t idoall/ubuntu:18.04.5 .

# run
docker run -it \
--rm \
--name ubuntu18 \
--hostname ubuntu18 \
idoall/ubuntu:18.04.5 \
/bin/bash


# view supervisor version
docker run -it --rm --name ubuntu18 idoall/ubuntu:18.04.5 supervisord -v


# deamon contain
docker run -d \
--name ubuntu18 \
--hostname ubuntu18 \
idoall/ubuntu:18.04.5

# access the contain
docker exec -it ubuntu18 /bin/bash

```