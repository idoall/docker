# docker-centos6.8-supervisor


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`centos:6.8`](https://hub.docker.com/r/library/centos/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd supervisor3.3.0

# hack hack hack

# build
docker build -t idoall/supervisor ./tag

# run
docker run -it \
--name supervisor \
--hostname supervisor \
-p 2222:22 \
idoall/supervisor \
/bin/bash

# view supervisor version
docker exec -it supervisor supervisord -v

# ssh  user:work   password:123456
ssh work@<your ip> -p 2222

```