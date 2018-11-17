This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/ubuntu:16.04`](https://hub.docker.com/r/idoall/ubuntu/)



# Supported tags and respective `Dockerfile` links

- [`8.0.112`(*8.0.112/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-jdk/8.0.112/Dockerfile)

- [`10`(*10/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-jdk/10/Dockerfile)

  ​

## Developing

```bash

# view version
docker run -it --name=idoall_jdk --rm idoall/ubuntu16.04-jdk:<version> java -version

# Run
docker run -d --name=idoall_jdk idoall/ubuntu16.04-jdk:<version>

# access the contain
docker exec -it idoall_jdk /bin/bash
```
