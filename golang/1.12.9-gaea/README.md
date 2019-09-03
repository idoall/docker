idoall/golang:1.12.4-gaea
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.12.9-gaea

# hack hack hack

# Build
docker build -t idoall/golang:1.12.9-gaea .

# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.12.9-gaea \
go version
```
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.12.9-gaea \
/bin/bash