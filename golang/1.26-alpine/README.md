golang 1.26-alpine
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.26-alpine

# hack hack hack

# Build
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/golang:1.26-alpine \
  -t registry.cn-beijing.aliyuncs.com/mshk/golang:1.26-alpine \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .


# view golang version
docker run -i \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.26-alpine \
go version


# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.26-alpine


# access the contain
docker exec -it golang /bin/bash
```
