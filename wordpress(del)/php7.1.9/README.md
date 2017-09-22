# 目录

[TOC]

# Docker-Centos6.8-Tengine/2.2.0 (nginx/1.8.1)-Wordpress4.8.1-PHP7.1.9


This repository contains the sources for the following base images:
- [`idoall/nginx-php`](https://hub.docker.com/r/idoall/nginx-php/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd wordpress

# hack hack hack

# build
docker build -t idoall/wordpress:4.8.1-php7.1.9 .

# run
docker run -d \
--name wordpress \
--hostname wordpress \
--link some-mysql:mysql \
-p 8080:80 \
idoall/wordpress:4.8.1-php7.1.9

# Open http://localhost:8080/ in your browser

# view version
docker exec -it nginx-php php -v
```

The following environment variables are also honored for configuring your WordPress instance:

- `-e WORDPRESS_DB_HOST=...` (defaults to the IP and port of the linked `mysql` container)
- `-e WORDPRESS_DB_USER=...` (defaults to "root")
- `-e WORDPRESS_DB_PASSWORD=...` (defaults to the value of the `MYSQL_ROOT_PASSWORD`environment variable from the linked `mysql` container)
- `-e WORDPRESS_DB_NAME=...` (defaults to "wordpress")
- `-e WORDPRESS_TABLE_PREFIX=...` (defaults to "", only set this when you need to override the default table prefix in wp-config.php)
- `-e WORDPRESS_AUTH_KEY=...`, `-e WORDPRESS_SECURE_AUTH_KEY=...`, `-e WORDPRESS_LOGGED_IN_KEY=...`, `-e WORDPRESS_NONCE_KEY=...`, `-e WORDPRESS_AUTH_SALT=...`, `-e WORDPRESS_SECURE_AUTH_SALT=...`, `-e WORDPRESS_LOGGED_IN_SALT=...`, `-e WORDPRESS_NONCE_SALT=...` (default to unique random SHA1s)

If the `WORDPRESS_DB_NAME` specified does not already exist on the given MySQL server, it will be created automatically upon startup of the `wordpress` container, provided that the `WORDPRESS_DB_USER`specified has the necessary permissions to create it.

## Directory structure inside image

/home/work/_app/nginx # Nginx root
/home/work/_logs/nginx # Nginx,PHP logs
/home/work/_app/nginx/html # meant to contain web content

# Custom Nginx Config files
Sometimes you need a custom config file for nginx to achieve this read the [Nginx config guide](https://hub.docker.com/r/idoall/nginx/)

