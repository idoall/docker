# 目录

[TOC]

# Docker-Centos6.8-Tengine/2.2.0 (nginx/1.8.1)-PHP5.6.29-dowuwiki2016-06-26


This repository contains the sources for the following base images:
- [`idoall/nginx-php`](https://hub.docker.com/r/idoall/nginx-php/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd dokuwiki

# hack hack hack

# build
docker build -t idoall/dokuwiki .

# run
docker run -d \
--name dokuwiki \
--hostname dokuwiki \
-p 80:80 \
idoall/dokuwiki

# Then setup dokuwiki using installer at URL http://localhost/install.php

```


## Where is the data stored? 

The JIRA container uses host mounted volumes to store persistent data:

| Local location            | Container location |
| ------------------------- | ------------------ |
| `/srv/jira/dokuwiki_folder` | `/home/work/_app/nginx/html`   |

You can fine tune these directories to meet your requirements.