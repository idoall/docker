
docker-ubuntu16.04-golang1.9
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/ubuntu16.04-golang:1.4`](https://hub.docker.com/r/idoall/ubuntu16.04-golang/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jdk/10

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-jdk:10 .

# view version
docker run -it --name=idoall_jdk --rm idoall/ubuntu16.04-jdk:10 java -version

# Run
docker run -d --name=idoall_jdk idoall/ubuntu16.04-jdk:10

# access the contain
docker exec -it idoall_jdk /bin/bash
```
