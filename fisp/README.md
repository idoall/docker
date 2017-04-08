# 目录

[TOC]

# FIS3-PHP-Nodejs4.X-JDK8 (nginx/1.8.1)-PHP5.6.29-dowuwiki2016-06-26



This repository contains the sources for the following base images:
- [`idoall/supervisor`](https://hub.docker.com/r/idoall/supervisor/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd fisp

# hack hack hack

# build
docker build -t idoall/fisp .

# run container
docker run -d \
--name fisp \
--hostname fisp \
-p 8000:8080 \
idoall/fisp

# start fisp
docker exec -it fisp fisp server start

# 对设置的目录进行实时更新监控
docker exec -it fisp fisp release -w -r /home/work/_website/pc-demo/home

# Then setup fis at URL http://localhost:8000

```


## Where is the data stored? 

The fis3 container uses host mounted volumes to store persistent data:

| Local location            | Container location |
| ------------------------- | ------------------ |
| `/fis folder` | `/home/work/_app/_website`   |

You can fine tune these directories to meet your requirements.


# About FISP

FIS-PLUS 是基于 FIS，应用于后端是 PHP，模板是 Smarty 的场景。现在被大多数百度产品使用。

http://fex-team.github.io/fis-plus/document.html#%25E5%25BF%25AB%25E9%2580%259F%25E5%2585%25A5%25E9%2597%25A8

# About FIS3

解决前端开发中自动化工具、性能优化、模块化框架、开发规范、代码部署、开发流程等问题

http://fis.baidu.com/fis3/index.html