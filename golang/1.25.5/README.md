golang 1.25.5
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.25.5

# hack hack hack

# Build
docker buildx build \
  -t registry.cn-beijing.aliyuncs.com/mshk/golang:1.25.5 \
  --platform linux/amd64,linux/arm64 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .

 docker buildx build \
  -t idoall/golang:1.25.5 \
  --platform linux/amd64,linux/arm64 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .


# view golang version
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.25.5 \
go version


# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.25.5


# access the contain
docker exec -it golang /bin/bash
```
