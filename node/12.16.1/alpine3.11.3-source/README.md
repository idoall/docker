node 12.16.1-alpine3.11.3-source
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/12.16.1/alpine3.11.3-source

# hack hack hack

# Build
docker build -t idoall/node:12.16.1-alpine3.11.3-source .

# view node version
docker run -it \
--rm \
--name node \
--hostname node \
idoall/node:12.16.1-alpine3.11.3-source \
node -v

# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:12.16.1-alpine3.11.3-source \
/bin/bash
```