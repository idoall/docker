# docker-supervisor


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`centos:7`](https://hub.docker.com/r/library/centos/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd supervisor3.3.0

# hack hack hack

# build
docker build -t idoall/supervisor .

# run
docker run -d \
--name=supervisor \
--hostname=supervisor \
idoall/supervisor

# view version
docker exec -it supervisor supervisord -v

```