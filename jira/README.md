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
    -v ./mysql-db:/var/lib/mysql \
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
​	1、打开浏览器：http://localhost:20012，选择`I'll set it up myself`-`Next`

> 如遇到访问错误，请执行步骤4



​	2、在`Database setup`，选择`My Own Database`，按以下信息选择和输入

> Database Type：MySQL
>
> Hostname：mysql
>
> Port：3306
>
> Database：jira
>
> Username：jira
>
> Password：jira

​	然后执行`Test Connection`，测试数据库连接上后，点击`Next`，开始在数据库创建`jira`需要的表，过程会有些慢。

​	最后生成的数据库配置文件位置：/var/atlassian/application-data/jira/dbconfig.xml



​	3、Set up application properties

​	输入你的`Application Title`，选择`Mode`，输入`Base URL`，点击`Next`

> Application Title 建议不要输入中文，我这里测试出错
>
> Mode中，我们在此使用的是Private模式，在这个模式下，用户的创建需要由管理员创建。而在Public模式下，用户是可以自己进行注册



​	4、Specify your license key

​	点击`generate a JIRA trial license`，上网申请个临时30天的许可证。

​	在申请`New Evaluation License`的时候，选择如下，然后点击`Generate License`：

> Product：JIRA Software
>
> License type：JIRA Software (Data Center)
>
> Organization：输入你的组织名称
>
> Your instance is：up and running
>
> Server ID：如果你是从`generate a JIRA trial license`点击过来的，会自动带上 Server ID

​	点击生成的`License Key`右侧的输入框，会提示你是否跳转回原来的localhost站点，选择`YES`，会回到http://localhost:20012/，然后点击`Next`

​	

​	5、Set up administrator account

​	输入你的全称、邮件、用户名、密码，点击`Next`

> 如果出现错误，重新执行第1步

4、进入容器

```bash
docker exec -it jira /bin/bash
```
使用以下命令重启服务，会自动改为2033年到期。
```bash
service jira stop && service jira start
```
5、中文版在 https://translations.atlassian.com/dashboard/download?lang=zh_CN#/JIRA Core/7.2.1 下载中文包，然后登录到jira后在