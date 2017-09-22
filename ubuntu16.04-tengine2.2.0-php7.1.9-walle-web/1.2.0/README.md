# 目录

[TOC]

# Docker-Walle-Web/1.2.0-PHP7.1.9-Tengine/2.2.0 (Nginx/1.8.1)-Ubuntu/16.04



This repository contains the sources for the following base images:
- [`idoall/idoall/ubuntu16.04-tengine2.2.0-php:7.1.9`](https://hub.docker.com/r/idoall/ubuntu16.04-tengine2.2.0-php/)



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-tengine2.2.0-php7.1.9-walle-web/1.2.0

# hack hack hack

# build
docker build -t idoall/ubuntu16.04-tengine2.2.0-php7.1.9-walle-web:1.2.0 .

# run mysql
docker run -d \
    --name=mysql-db \
    --hostname=mysql-db \
    -p 20010:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=walle-web \
    idoall/mysql:5.6

# run
docker run -it \
--rm \
--name walle \
--hostname walle \
--link mysql-db:mysql \
-p 80:80 \
-p 2222:2222 \
idoall/ubuntu16.04-tengine2.2.0-php7.1.9-walle-web:1.2.0


# default   user-admin  password-admin
# Open http://localhost in your browser and you should see


# access the contain
docker exec -it walle /bin/bash

```





## Environment Variables

生成容器时的一些参数

### `MYSQL_HOST`

MySql的地址，默认是创建连接后的`mysql`

### `MYSQL_DB`

数据库名称，默认是`walle-web`

### `MYSQL_USERNAME`

数据库帐号，默认是`root`

### `MYSQL_PASSWORD`

数据库密码，默认是`123456`

# About Walle-web

Walle 一个web部署系统工具，配置简单、功能完善、界面流畅、开箱即用！支持git、svn版本管理，支持各种web代码发布，PHP，Python，JAVA等代码的发布、回滚，可以通过web来一键完成。

http://www.walle-web.io/