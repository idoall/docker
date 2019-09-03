This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/centos:7.6`](https://hub.docker.com/r/idoall/centos7.6/)



# Supported tags and respective `Dockerfile` links

- [`1.12.9`(*1.12.9/Dockerfile*)](https://github.com/idoall/docker/blob/master/centos7.6-golang/1.12.9/Dockerfile)

- [`1.4`(*1.4/Dockerfile*)](https://github.com/idoall/docker/blob/master/centos7.6-golang/1.4/Dockerfile)

  ​

## Developing

```bash

# view version
docker run -it --name=golang --rm idoall/centos7.6-golang:<version> go version

# Run
docker run -d --name=golang idoall/centos7.6-golang:<version>

# access the contain
docker exec -it golang /bin/bash
```
