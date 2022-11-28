node 18.12.1-alpine3.16
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/18.12.1/alpine3.16

# hack hack hack

# Build
docker build -t idoall/node:18.12.1-alpine3.16 .

# view node version
docker run -it \
--rm \
--name node \
--hostname node \
idoall/node:18.12.1-alpine3.16 \
node -v

# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:18.12.1-alpine3.16 \
/bin/sh
```