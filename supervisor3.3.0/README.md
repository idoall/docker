# docker-supervisor


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/docker-golang1.7.4-revel0.13`](https://hub.docker.com/r/idoall/docker-golang1.7.4-revel0.13/)


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