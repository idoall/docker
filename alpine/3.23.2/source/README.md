# alpine:3.23.2-source

增加 supervisord 

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd alpine/3.23.2/source

# hack hack hack

# build
docker buildx build \
  -t registry.cn-beijing.aliyuncs.com/mshk/alpine:3.23.2-source \
  --platform linux/amd64,linux/arm64 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .

 docker buildx build \
  -t idoall/alpine:3.23.2-source \
  --platform linux/amd64,linux/arm64 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .
```

## 安装

```bash
# run
docker run -it \
--rm \
--name alpine \
idoall/alpine:3.23.2-source date
# Mon Apr 15 18:08:08 CST 2019

# run
docker run -it \
--rm \
--name alpine \
--hostname alpine \
idoall/alpine:3.23.2-source



# access the contain
docker exec -it alpine /bin/bash
```
