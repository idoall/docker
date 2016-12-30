# docker-centos6.8-supervisor-jira7.2汉化破解版


This repository contains the sources for the following base images:
- [`idoall/supervisor`](https://hub.docker.com/r/idoall/supervisor/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd jira

# hack hack hack

# build
docker build -t idoall/jira .

# run mysql
docker run -d \
    --name=mysql-db \
    --hostname=mysql-db \
    -v /Users/lion/my_docker/mysql-db:/var/lib/mysql \
    -p 20010:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=jira \
    -e MYSQL_USER=jira \
    -e MYSQL_PASSWORD=jira \
    mysql:5.6

# run
docker run -d \
--name jira \
--hostname jira \
--link mysql-db:mysql \
-p 20011:8085 \
-p 20012:8080 \
-p 20013:8443 \
-p 20014:8090 \
-p 20015:22 \
idoall/jira

# ssh  user:work   password:123456
ssh work@<your ip> -p 2222

```