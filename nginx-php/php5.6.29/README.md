# 目录

[TOC]

# Docker-Centos6.8-Tengine/2.2.0 (nginx/1.8.1)-PHP5.6.29


This repository contains the sources for the following base images:
- [`idoall/nginx`](https://hub.docker.com/r/idoall/nginx/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd nginx-php

# hack hack hack

# build
docker build -t idoall/nginx-php:php5.6.29 .

# run
docker run -d \
--name nginx-php \
--hostname nginx-php \
-p 8080:80 \
idoall/nginx-php:php5.6.29

# Open http://localhost:8080/ in your browser and you should see "php info!"

# view version
docker exec -it nginx-php:php5.6.29 php -v
```

## Directory structure inside image
/home/work/_app/nginx # Nginx root
/home/work/_logs/nginx # Nginx,PHP logs
/home/work/_app/nginx/html # meant to contain web content

# Custom Nginx Config files
Sometimes you need a custom config file for nginx to achieve this read the [Nginx config guide](https://hub.docker.com/r/idoall/nginx/)

## meant to contain web content
```bash
docker run -d \
--name nginx-php \
--hostname nginx-php \
-v /mysite:/home/work/_app/nginx/html \
-p 8080:80 \
idoall/nginx-php:php5.6.29
```
