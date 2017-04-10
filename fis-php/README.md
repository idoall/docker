# 目录

[TOC]

# FIS3-PHP6-Nodejsv0.12.0-NPM-JDK8



This repository contains the sources for the following base images:
- [`idoall/supervisor`](https://hub.docker.com/r/idoall/supervisor/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd fis-php

# hack hack hack

# build
docker build -t idoall/fis-php .

# run container
docker run -d \
--name fis-php \
--hostname fis-php \
-p 8000:8080 \
idoall/fis-php

# Compile fis-php
docker exec -it fis-php fis3 release -r /home/work/_website/common
docker exec -it fis-php fis3 release -r /home/work/_website/subsiteA
docker exec -it fis-php fis3 release -r /home/work/_website/subsiteB

# start fis-php
docker exec -it fis-php fis3 server start --type php --rewrite

# Then setup fis at URL http://localhost:8000



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