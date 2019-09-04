# Alpine/3.10.2

增加 supervisord 

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd alpine/3.10.2

# hack hack hack

# build
docker build -t idoall/alpine:3.10.2 .
```

## 安装

```bash
# run
docker run -it \
--rm \
--name alpine \
idoall/alpine:3.10.2 date
# Mon Apr 15 18:08:08 CST 2019

# run
docker run -it \
--rm \
--name alpine \
--hostname alpine \
idoall/alpine:3.10.2


# view supervisor version
docker exec -it alpine supervisord -v


# access the contain
docker exec -it alpine /bin/bash
```
