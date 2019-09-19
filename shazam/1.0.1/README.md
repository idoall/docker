# 目录

[TOC]

shazam/1.0.1
=============
shazam ([ʃə'zæm], 沙赞)是一款兼容MySQL协议的数据库中间件, 其前身是Gaea.


Gaea是小米中国区电商研发部研发的基于mysql协议的数据库中间件，目前在小米商城大陆和海外得到广泛使用，包括订单、社区、活动等多个业务。Gaea支持分库分表、sql路由、读写分离等基本特性，更多详细功能可以参照下面的功能列表。其中分库分表方案兼容了mycat和kingshard两个项目的路由方式。Gaea在设计、实现阶段参照了mycat、kingshard和vitess，并使用tidb parser作为内置的sql parser。

https://github.com/idoall/shazam

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd shazam/1.0.1

# hack hack hack

# Build
docker build -t idoall/shazam:1.0.1 .

# Run rm
docker run -it --rm --name=shazam -p 13306:13306 idoall/shazam:1.0.1

# Run -d
docker run -d --name=shazam -p 13306:13306 idoall/shazam:1.0.1

# access the contain
docker exec -it shazam /bin/bash

# rm the contain
docker stop shazam && docker rm shazam


# run
docker run -it \
--rm \
--name shazam \
--hostname shazam \
idoall/shazam:1.0.1 \
/bin/sh


# view supervisor version
docker exec -it shazam supervisord -v


# access the contain
docker exec -it shazam /bin/bash
```

## Directory structure inside
/home/work/_app/_shazam/etc # etc config