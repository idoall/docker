This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/golang:1.12.9`](https://hub.docker.com/r/idoall/golang)

=============

Gaea是小米中国区电商研发部研发的基于mysql协议的数据库中间件，目前在小米商城大陆和海外得到广泛使用，包括订单、社区、活动等多个业务。Gaea支持分库分表、sql路由、读写分离等基本特性，更多详细功能可以参照下面的功能列表。其中分库分表方案兼容了mycat和kingshard两个项目的路由方式。Gaea在设计、实现阶段参照了mycat、kingshard和vitess，并使用tidb parser作为内置的sql parser，在此表达诚挚感谢。

# Supported tags and respective `Dockerfile` links

- [`1.0.1`(*1.0.1/Dockerfile*)](https://github.com/idoall/docker/blob/master/golang1.12.9-gaea/1.0.1/Dockerfile)

  ​
## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd centos7.6-golang1.12.9-gaea/1.0.1

# hack hack hack

# Build
docker build -t idoall/centos7.6-golang1.12.9-gaea:1.0.1 .

# Run
docker run -d --name=gaea -p 13306:13306 idoall/centos7.6-golang1.12.9-gaea:1.0.1

# access the contain
docker exec -it gaea /bin/bash

# rm the contain
docker stop gaea && docker rm gaea
```

## Directory structure inside
/home/work/_project/golang/src/github.com/idoall/Gaea/etc # etc config