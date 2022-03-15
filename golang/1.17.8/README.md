golang 1.17.8
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.17.8

# hack hack hack

# Build
docker build -t idoall/golang:1.17.8 .


# view golang version
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.17.8 \
go version


# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.17.8


# access the contain
docker exec -it golang /bin/bash
```
