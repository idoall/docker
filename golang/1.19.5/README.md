golang 1.19.5
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.19.5

# hack hack hack

# Build
docker build -t idoall/golang:1.19.5 .


# view golang version
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.19.5 \
go version


# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.19.5


# access the contain
docker exec -it golang /bin/bash
```
