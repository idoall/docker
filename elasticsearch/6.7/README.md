# Docker-Nginx/1.12.1-Ubuntu/16.04


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/ubuntu16.04-sshd`](https://hub.docker.com/r/idoall/ubuntu16.04-sshd/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd elasticsearch/6.7

# hack hack hack

# build
docker build -t idoall/elasticsearch:6.7 .

# run
docker run -it \
--rm \
--name elasticsearch \
--hostname elasticsearch \
-e "discovery.type=single-node" \
-p 9200:9200 \
-p 9300:9300 \
idoall/elasticsearch:6.7
```

浏览 http://localhost:9200/ 能够看到下面的信息，说明已经运行成功

```bash
{
  "name" : "tXbv0KV",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "ZxcckgjmQiaRclPFdornSw",
  "version" : {
    "number" : "6.7.0",
    "build_flavor" : "default",
    "build_type" : "docker",
    "build_hash" : "8453f77",
    "build_date" : "2019-03-21T15:32:29.844721Z",
    "build_snapshot" : false,
    "lucene_version" : "7.7.0",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}
```


```
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


