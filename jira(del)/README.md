# 目录

[TOC]

# docker-centos6.8-supervisor-jira7.2.7汉化破解版


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
    -p 20010:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=jira \
    -e MYSQL_USER=jira \
    -e MYSQL_PASSWORD=jira \
    idoall/mysql:5.6

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


# For the first time, initialize the program, please wait
# Open http://localhost:20012 in your browser and you should see
```


## Where is the data stored? 

The JIRA container uses host mounted volumes to store persistent data:

| Local location            | Container location |
| ------------------------- | ------------------ |
| `/srv/jira/opt_atlassian` | `/opt/atlassian`   |
| `/srv/jira/var_atlassian` | `/var/atlassian`   |

You can fine tune these directories to meet your requirements.



更详细的汉化、破解方法：[Docker创建JIRA 7.2.7中文破解版](http://idoall.org/blog/post/lion/Docker%E5%88%9B%E5%BB%BAJIRA-7.2.7%E4%B8%AD%E6%96%87%E7%A0%B4%E8%A7%A3%E7%89%88) ​

