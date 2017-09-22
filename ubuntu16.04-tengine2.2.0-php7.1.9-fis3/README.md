# 目录

[TOC]

# Docker-FIS3-PHP7.1.9-Tengine/2.2.0 (Nginx/1.8.1)-Ubuntu/16.04



This repository contains the sources for the following base images:
- [`idoall/idoall/ubuntu16.04-tengine2.2.0-php:7.1.9`](https://hub.docker.com/r/idoall/ubuntu16.04-tengine2.2.0-php/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-tengine2.2.0-php7.1.9-fis3

# hack hack hack

# build
docker build -t idoall/ubuntu16.04-tengine2.2.0-php7.1.9-fis3 .

# run container
docker run -it \
--rm \
--name fis-php \
--hostname fis-php \
-p 8080:8080 \
idoall/ubuntu16.04-tengine2.2.0-php7.1.9-fis3

# Compile fis-php
docker exec -it fis-php fis3 release -r /home/work/_website/common
docker exec -it fis-php fis3 release -r /home/work/_website/subsiteA
docker exec -it fis-php fis3 release -r /home/work/_website/subsiteB

# start fis-php
docker exec -it fis-php fis3 server start --type php --rewrite

# Then setup fis at URL http://localhost:8080



# access container
docker exec -it fis-php /bin/bash

# more release parameters
docker exec -it fis-php fis3 release --help

```


## Where is the data stored? 

The fis3 container uses host mounted volumes to store persistent data:

| Local location | Container location    |
| -------------- | --------------------- |
| `/fis folder`  | `/home/work/_website` |

You can fine tune these directories to meet your requirements.



# About FIS3

解决前端开发中自动化工具、性能优化、模块化框架、开发规范、代码部署、开发流程等问题

http://fis.baidu.com/fis3/index.html