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
  --platform linux/amd64,linux/arm64 \
  -t idoall/golang:1.25.5 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .


# view golang version
docker run -i \
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
