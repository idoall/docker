golang 1.13.8-stretch
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.13.8/stretch

# hack hack hack

# Build
docker build -t idoall/golang:1.13.8-stretch .


# view golang version
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.13.8-stretch \
go version


# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.13.8-stretch


# access the contain
docker exec -it golang /bin/bash
```
