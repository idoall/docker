node:10.15.3
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd node/10.15.3-alpine

# hack hack hack

# Build
docker build -t idoall/node:10.15.3-alpine .

# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=node \
idoall/node:10.15.3-alpine \
/bin/bash
```