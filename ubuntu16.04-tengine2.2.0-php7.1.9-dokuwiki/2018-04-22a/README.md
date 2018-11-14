# 目录

[TOC]

# Docker-Dokuwiki-PHP7.1.9-Tengine/2.2.0 (Nginx/1.8.1)-Ubuntu/16.04



This repository contains the sources for the following base images:
- [`idoall/idoall/ubuntu16.04-tengine2.2.0-php:7.1.9`](https://hub.docker.com/r/idoall/ubuntu16.04-tengine2.2.0-php/)



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-tengine2.2.0-php7.1.9-dokuwiki/2018-04-22a

# hack hack hack

# build
docker build -t idoall/ubuntu16.04-tengine2.2.0-php7.1.9-dokuwiki:20180412a .

# run
docker run -it \
--rm \
--name dokuwiki \
--hostname dokuwiki \
-p 80:80 \
idoall/ubuntu16.04-tengine2.2.0-php7.1.9-dokuwiki:20180412a

# Then setup dokuwiki using installer at URL http://localhost/install.php
```


## Where is the data stored? 

The dokuwiki container uses host mounted volumes to store persistent data:

| Local location         | Container location                       |
| ---------------------- | ---------------------------------------- |
| `/srv/dokuwiki_folder` | `/home/work/_app/nginx/html` |

You can fine tune these directories to meet your requirements.