
golang1.7.4-docker
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`library/alpine`](https://hub.docker.com/r/library/alpine/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang1.7.4

# hack hack hack

# Build
docker build -t idoall/golang .

# view version
docker run -it --name=golang --rm idoall/golang go version

# Run
docker run -it --name=golang idoall/golang /bin/bash
```
