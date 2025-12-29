node 22.21.1-slim
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/22.21.1/slim

# hack hack hack

# Build
docker buildx build -t idoall/node:22.21.1-slim --platform linux/amd64,linux/arm64 .

# view node version
docker run -it \
--rm \
--name node \
--hostname node \
idoall/node:22.21.1-slim \
node -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:22.21.1-slim \
/bin/sh
```
