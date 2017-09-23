This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/centos:6.8`](https://hub.docker.com/r/idoall/centos6.8/)



# Supported tags and respective `Dockerfile` links

- [`1.9`(*1.9/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-golang/1.9/Dockerfile)

- [`1.7.4`(*1.7.4/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-golang/1.7.4/Dockerfile)

- [`1.4.3`(*1.4.3/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-golang/1.4/Dockerfile)

  ​

## Developing

```bash

# view version
docker run -it --name=golang --rm idoall/centos6.8-golang:<version> go version

# Run
docker run -d --name=golang idoall/centos6.8-golang:<version>

# access the contain
docker exec -it golang /bin/bash
```
