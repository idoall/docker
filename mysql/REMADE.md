# docker-centos6.8-mysql5.7.11


This repository contains the sources for the following base images:
- [`idoall/supervisor`](https://hub.docker.com/r/idoall/supervisor/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd mysql

# hack hack hack

# build
docker build -t idoall/mysql .

# run
# default root-password:123456
docker run -d \
--name mysql \
--hostname mysql \
-p 6033:3306 \
-p 2222:22 \
idoall/mysql


# ssh  user:work   password:123456
ssh work@<your ip> -p 2222

```

# Configuration without a cnf file
```bash
docker run -d \
--name mysql \
--hostname mysql \
-v /my/custom.cnf:/etc/my.cnf
-p 6033:3306 \
-p 2222:22 \
idoall/mysql
```


# Where to Store Data
```bash
docker run -d \
--name mysql \
--hostname mysql \
-v /my/own/datadir:/home/work/_app/mysql/data/ \
-p 6033:3306 \
-p 2222:22 \
idoall/mysql
```


<<<<<<< HEAD
# MYSQL_ROOT_PASSWORD 初始化root密码
=======
# MYSQL_ROOT_PASSWORD 初台化root密码
>>>>>>> upstream/master
```bash
docker run -d \
--name mysql \
--hostname mysql \
-e MYSQL_ROOT_PASSWORD=654321 \
-p 6033:3306 \
-p 2222:22 \
idoall/mysql
```