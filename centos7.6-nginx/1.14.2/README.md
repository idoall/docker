# 目录

[TOC]

# Docker-Nginx/1.14.2-Centos/7.6


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/centos7.6`](https://hub.docker.com/r/idoall/centos7.6/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd centos7.6-nginx/1.14.2

# hack hack hack

# build
docker build -t idoall/centos7.6-nginx:1.14.2 .

# run
docker run -it \
--rm \
--name nginx \
--hostname nginx \
-p 80:80 \
idoall/centos7.6-nginx:1.14.2


# access the contain
docker exec -it nginx /bin/bash


# view version
docker exec -it nginx /home/work/_app/nginx/sbin/nginx -v

```


## complex configuration
```bash
docker run -d \
--name nginx \
--hostname nginx \
-v /my/nginx.conf:/home/work/_app/nginx/conf/nignx.conf \
-p 80:80 \
idoall/centos7.6-nginx:1.14.2
```


## hosting some simple static content
```bash
docker run -d \
--name nginx \
--hostname nginx \
-v /some/content:/home/work/_app/nginx/html \
-p 8080:80 \
idoall/centos7.6-nginx:1.14.2
```

# Directory structure inside image
/home/work/_app/nginx # Nginx root
/home/work/_logs/nginx # Nginx logs
/home/work/_app/nginx/html # meant to contain web content


# About Nginx

Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other *nix flavors. It also has a proof of concept port for Microsoft Windows.


https://en.wikipedia.org/wiki/Nginx/