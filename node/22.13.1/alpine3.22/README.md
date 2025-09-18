node 22.13.1-alpine3.21
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/22.13.1/alpine3.21

# hack hack hack

# Build
docker build -t idoall/node:22.13.1-alpine3.21 .

# view node version
docker run -it \
--rm \
--name node \
--hostname node \
idoall/node:22.13.1-alpine3.21 \
node -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:22.13.1-alpine3.21 \
/bin/sh
```