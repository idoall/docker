node 22.13.1-slim
=============

Add python make g++ git

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd wordpress/6.8.2-php8.3-fpm

# hack hack hack

# Build 让 Mac 架构同时兼容 arm64 和 amd64
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/wordpress:6.8.2-php8.3-fpm \
  .

# view php version
docker run -it \
--rm \
--name wordpress \
--hostname wordpress \
idoall/wordpress:6.8.2-php8.3-fpm \
php -v


# Run After running, wait for 1 minutes.
$ docker run -it --rm \
--name=wordpress \
idoall/wordpress:6.8.2-php8.3-fpm \
/bin/sh
```

