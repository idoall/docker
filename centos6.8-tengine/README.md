This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/centos6.8-sshd`](https://hub.docker.com/r/idoall/centos6.8-sshd/)



# Supported tags and respective `Dockerfile` links

- [`2.2.0`(*2.2.0/Dockerfile*)](https://github.com/idoall/docker/blob/master/centos6.8-tengine/2.2.0/Dockerfile)

  ​

## Developing

```bash

# run
docker run -it \
--rm \
--name nginx \
--hostname nginx \
-p 2222:2222 \
-p 80:80 \
idoall/centos6.8-tengine:<version>


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
idoall/centos6.8-tengine:<version>
```


## hosting some simple static content
```bash
docker run -d \
--name nginx \
--hostname nginx \
-v /some/content:/home/work/_app/nginx/html \
-p 8080:80 \
idoall/centos6.8-tengine:<version>
```



# About Tengine

Tengine是由淘宝网发起的Web服务器项目。它在Nginx的基础上，针对大访问量网站的需求，添加了很多高级功能和特性。Tengine的性能和稳定性已经在大型的网站如淘宝网，天猫商城等得到了很好的检验。它的最终目标是打造一个高效、稳定、安全、易用的Web平台。

从2011年12月开始，Tengine成为一个开源项目，Tengine团队在积极地开发和维护着它。Tengine团队的核心成员来自于淘宝、搜狗等互联网企业。Tengine是社区合作的成果，我们欢迎大家参与其中，贡献自己的力量。

http://tengine.taobao.org/



## ChangeLog

http://tengine.taobao.org/changelog.html