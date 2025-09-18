node 22.13.1-slim
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/22.13.1/slim

# hack hack hack

# Build
docker build -t idoall/node:22.13.1-slim .

# view node version
docker run -it \
--rm \
--name node \
--hostname node \
idoall/node:22.13.1-slim \
node -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:22.13.1-slim \
/bin/sh
```