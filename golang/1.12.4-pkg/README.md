gitlab-runner:alpine-v11.10.0
=============

## Developing



```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.12.4-pkg

# hack hack hack

# Build
docker build -t idoall/golang:1.12.4-pkg .

# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.12.4-pkg \
go version
```
