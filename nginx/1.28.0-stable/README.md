nginx 1.28.0-stable
=============


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd nginx/1.28.0-stable

# hack hack hack

# Build 让 Mac 架构同时兼容 arm64 和 amd64
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/nginx:1.28.0-stable \
  .

# view php version
docker run -it \
--rm \
--name nginx \
--hostname nginx \
idoall/nginx:1.28.0-stable \
nginx -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=nginx \
idoall/nginx:1.28.0-stable \
/bin/sh
```

