This repository contains the sources for the following [docker](https://docker.io) base images:

- [`centos`](https://hub.docker.com/r/library/centos/)



# Supported tags and respective `Dockerfile` links

- [`6.8`(*6.8/Dockerfile*)](https://github.com/idoall/docker/blob/master/centos/6.8/Dockerfile)
- [`7.6`(*7.6/Dockerfile*)](https://github.com/idoall/docker/blob/master/centos/7.6/Dockerfile)

  ​

## Developing

```bash

# run
docker run -it \
--rm \
--name centos \
--hostname centos \
idoall/centos:<version>


# view supervisor version
docker exec -it centos supervisord -v


# access the contain
docker exec -it centos /bin/bash

```