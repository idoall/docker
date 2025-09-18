node 24.8.0-alpine3.22.1
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/24.8.0/alpine3.22.1

# hack hack hack

# Build
docker build -t idoall/node:24.8.0-alpine3.22.1 .

# view node version
docker run -it \
--rm \
--name node \
--hostname node \
idoall/node:24.8.0-alpine3.22.1 \
node -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:24.8.0-alpine3.22.1 \
/bin/sh
```