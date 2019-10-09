golang 1.13.1
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.13.1

# hack hack hack

# Build
docker build -t idoall/golang:1.13.1-alpine3.10.2 .


# view golang version
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.13.1-alpine3.10.2 \
go version


# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.13.1-alpine3.10.2


# access the contain
docker exec -it golang /bin/bash
```
