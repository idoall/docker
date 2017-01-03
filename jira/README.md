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

```

## hack
1、打开浏览器：http://localhost:20012
2、创建数据库帐号和链接
3、在输入jira的license的时候，上网申请个临时30天的，使用`service jira stop && service jira start`重启服务器，会自动改为2033年到期。
4、中文版在 https://translations.atlassian.com/dashboard/download?lang=zh_CN#/JIRA Core/7.2.1 下载中文包，然后登录到jira后在