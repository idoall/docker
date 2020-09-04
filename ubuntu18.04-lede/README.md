This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/ubuntu:18.04`](https://hub.docker.com/r/idoall/ubuntu/)



# Supported tags and respective `Dockerfile` links

- [`20200416`(*20200416/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu18.04-LEDE/20200416/Dockerfile)


  ​

## Developing

```bash

# view version
docker run -it --name=mshk-lede --rm idoall/ubuntu18.04-LEDE:<version> LEDE -version

# Run
docker run -d --name=mshk-lede idoall/ubuntu18.04-LEDE:<version>

# access the contain
docker exec -it mshk-lede /bin/bash
```
