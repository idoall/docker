nginx 1.29.1
=============


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd nginx/1.29.1

# hack hack hack

# Build 让 Mac 架构同时兼容 arm64 和 amd64
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/nginx:1.29.1 \
  .

# view php version
docker run -it \
--rm \
--name nginx \
--hostname nginx \
idoall/nginx:1.29.1 \
nginx -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=nginx \
idoall/nginx:1.29.1 \
/bin/sh
```

