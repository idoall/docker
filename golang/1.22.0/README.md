golang 1.22.0
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.22.0

# hack hack hack

# Build
docker build -t idoall/golang:1.22.0 .


# view golang version
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.22.0 \
go version


# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.22.0


# access the contain
docker exec -it golang /bin/bash
```
