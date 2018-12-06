This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/ubuntu:16.04`](https://hub.docker.com/r/idoall/ubuntu/)



# Supported tags and respective `Dockerfile` links


- [`1.11.2`(*1.11.2/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-golang/1.11.2/Dockerfile)

- [`1.10.3`(*1.10.3/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-golang/1.10.3/Dockerfile)
- 
- [`1.9`(*1.9/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-golang/1.9/Dockerfile)

- [`1.7.4`(*1.7.4/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-golang/1.7.4/Dockerfile)

- [`1.4.3`(*1.4.3/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-golang/1.4/Dockerfile)

  ​

## Developing

```bash

# view version
docker run -it --name=golang --rm idoall/ubuntu16.04-golang:<version> go version

# Run
docker run -d --name=golang idoall/ubuntu16.04-golang:<version>

# access the contain
docker exec -it golang /bin/bash
```
