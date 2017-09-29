# Docker-Nginx/1.12.1-Ubuntu/16.04


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/ubuntu16.04-sshd`](https://hub.docker.com/r/idoall/ubuntu16.04-sshd/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-nginx/1.12.1

# hack hack hack

# build
docker build -t idoall/ubuntu16.04-nginx:1.12.1 .

# run
docker run -it \
--rm \
--name nginx \
--hostname nginx \
-p 2222:2222 \
-p 80:80 \
idoall/ubuntu16.04-nginx:1.12.1


# Open http://localhost/ in your browser


# access the contain
docker exec -it nginx /bin/bash


# ssh  user:work   password:123456
ssh work@<your ip> -p 2222

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
idoall/ubuntu16.04-nginx:1.12.1
```


## hosting some simple static content
```bash
docker run -d \
--name nginx \
--hostname nginx \
-v /some/content:/home/work/_app/nginx/html \
-p 8080:80 \
idoall/ubuntu16.04-nginx:1.12.1
```



# About Nginx

Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other *nix flavors. It also has a proof of concept port for Microsoft Windows.


https://en.wikipedia.org/wiki/Nginx/


