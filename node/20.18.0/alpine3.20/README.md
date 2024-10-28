node 20.18.0-alpine3.20
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/20.18.0/alpine3.20

# hack hack hack

# Build
docker build -t idoall/node:20.18.0-alpine3.20 .

# view node version
docker run -it \
--rm \
--name node \
--hostname node \
idoall/node:20.18.0-alpine3.20 \
node -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:20.18.0-alpine3.20 \
/bin/sh
```