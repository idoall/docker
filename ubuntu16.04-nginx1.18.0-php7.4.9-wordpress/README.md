This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/ubuntu16.04-nginx1.18.0-php:7.4.9`](https://hub.docker.com/r/idoall/ubuntu16.04-nginx1.18.0-php/)



# Supported tags and respective `Dockerfile` links

- [`5.5.1`(*5.5.1/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-nginx1.18.0-php7.4.9-wordpress/5.5.1/Dockerfile)

  ​

```bash

# run mysql
docker run -d \
--name mysqldb \
--hostname mysqldb \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=123456 \
idoall/mysql:5.7

# run
docker run -d \
--name wordpress \
--hostname wordpress \
--link some-mysql:mysql \
-p 80:80 \
idoall/ubuntu16.04-nginx1.18.0-php7.4.9-wordpress:<version>

# Open http://localhost/ in your browser

# access the contain
docker exec -it wordpress /bin/bash
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

Sometimes you need a custom config file for nginx to achieve this read the [Nginx config guide](https://hub.docker.com/r/idoall/ubuntu16.04-nginx/)
