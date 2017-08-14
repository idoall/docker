# 目录

[TOC]

# Docker-Centos6.8-Tengine/2.2.0 (nginx/1.8.1)-PHP5.6.29-Walle1.2.0


This repository contains the sources for the following base images:
- [`idoall/nginx-php`](https://hub.docker.com/r/idoall/nginx-php/)


## Developing
相关配置可以在docker-compose.yml文件中更改
```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd walle-web
```


## Build
```
docker build -t idoall/walle-web .
```



# 基于docker 1.13.1 以上版本的 docker Compose 运行方法

部署服务

```
docker-compose up
```



停止服务

```
docker-compose stop
```



移除服务

```
docker-compose rm
```

 default   user-admin  password-admin
 Open http://localhost in your browser and you should see



# 使用docker stack的编排服务，创建docker APP

部署服务
```shell
docker stack deploy -c docker-compose-stack.yml walle
```



查看服务状态

```shell
docker stack services walle
```



移除服务

```shell
docker stack rm walle
```

default   user-admin  password-admin
 Open http://localhost in your browser and you should see



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