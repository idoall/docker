node 22-alpine
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/22-alpine

# hack hack hack

# Build
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/node:22-alpine \
  -t registry.cn-beijing.aliyuncs.com/mshk/node:22-alpine \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .

# view node version
docker run -it \
--rm \
--name node \
--hostname node \
idoall/node:22-alpine \
node -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:22-alpine \
/bin/sh
```