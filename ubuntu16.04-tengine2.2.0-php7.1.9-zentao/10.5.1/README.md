# 目录

[TOC]

# Docker-zentao-PHP7.1.9-Tengine/2.2.0 (Nginx/1.8.1)-Ubuntu/16.04



This repository contains the sources for the following base images:
- [`idoall/idoall/ubuntu16.04-tengine2.2.0-php:7.1.9`](https://hub.docker.com/r/idoall/ubuntu16.04-tengine2.2.0-php/)



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-tengine2.2.0-php7.1.9-zentao/10.5.1

# hack hack hack

# build
docker build -t idoall/ubuntu16.04-tengine2.2.0-php7.1.9-zentao:10.5.1 .

# run
docker run -it \
--rm \
--name zentao \
--hostname zentao \
-p 80:80 \
idoall/ubuntu16.04-tengine2.2.0-php7.1.9-zentao:10.5.1

# Then setup zentao using installer at URL http://localhost/www/install.php
# 安装完以后，浏览:http://localhost/www/index.php登录
```


## Where is the data stored? 

The zentao container uses host mounted volumes to store persistent data:

| Local location         | Container location                       |
| ---------------------- | ---------------------------------------- |
| `/srv/zentao_folder` | `/home/work/_app/nginx/html` |

You can fine tune these directories to meet your requirements.


# 使用 docker stack 的编排服务，创建 docker APP

## 部署服务

```bash
docker stack deploy -c docker-compose.yml zentao
```

## 移除服务

```bash
docker stack rm zentao
```

## 查看服务列表

```bash
# 所有服务列表
docker service ls

# 指定应用的列表
docker stack services zentao
```

## 查看服务运行状态

```bash
watch docker service ps zentao
```