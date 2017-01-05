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





# hack



## 1、打开浏览器：http://localhost:20012

> 如遇到访问错误，请执行步骤10



## 2、JIRA setup

​	选择`I'll set it up myself`-`Next`



## 3、Database setup

​	在`Database setup`，选择`My Own Database`，按以下信息选择和输入

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



## 4、Set up application properties

​	输入你的`Application Title`，选择`Mode`，输入`Base URL`，点击`Next`

> Application Title 建议不要输入中文，我这里测试出错
>
> Mode中，我们在此使用的是Private模式，在这个模式下，用户的创建需要由管理员创建。而在Public模式下，用户是可以自己进行注册



## 5、Specify your license key

​	点击`generate a JIRA trial license`，上网申请个临时30天的许可证。

​	在申请`New Evaluation License`的时候，选择如下，然后点击`Generate License`：

> Product：JIRA Software
>
> License type：JIRA Software (Server)
>
> Organization：输入你的组织名称
>
> Your instance is：up and running
>
> Server ID：如果你是从`generate a JIRA trial license`点击过来的，会自动带上 Server ID

​	点击生成的`License Key`右侧的输入框，会提示你是否跳转回原来的localhost站点，选择`YES`，会回到http://localhost:20012/，然后点击`Next`

​	

## 6、Set up administrator account

​	输入你的全称：root、邮件：xxx@xxx.com、用户名：root、密码：123456，点击`Next`

> 如果出现错误，重新执行第1步



## 7、Set up email notifications

​		`Configure Email Notifications`选择`Later`，然后点击`Finish`



## 8、Welcome to JIRA, root!

​	选择`English (United States) [Default]`，点击`Continue`，设置头像时，点击`Next`。这样就完成了`JIRA`的设置。



## 9、创建一个新项目

​	进行完步骤8后，会进入到`JIRA`的首页，可以看到`Welcome!`的文字。

​	点击`Create a new project`，然后点击`Next`，继续点击`Select`。

​	在`Name`处输入test，点击`Submit`。



## 9、中文汉化

​	在 [https://translations.atlassian.com/dashboard/download?lang=zh_CN#/JIRA Core/7.2.7](https://translations.atlassian.com/dashboard/download?lang=zh_CN#/JIRA Core/7.2.7)下载中文包，保存到你的本地。

​	如果你是在步骤8操作以后，将鼠标移到右上角设置图标`长的像一个齿轮`点击，在弹出的下拉菜单中选择`Add-ons`，在左侧点击`Manage add-ons`，在右侧点击`Upload add-on`，在弹出的窗口中，选择你下载的中文包，然后点击`Upload`，耐心等待一下，看到弹出窗口提示`Installed and ready to go!`说明中文包安装成功了。

​	将鼠标移到右上角设置图标点击，在弹出的下拉菜单中选择`System`，点击右侧的`Edit Settings`，找到`Internationalization`，将`Indexing language`选择为`Chinese`，将`Default language`选择为`中文(中国)`，然后将页面拖动到最下方，点击`Update`。

​	这时，你将看到JIRA彻底的变成了中文版。



## 10、进入容器，重启jira服务

​	使用以下命令重启`JIRA`服务

```bash
docker exec jira sh service jira stop && docker exec jira sh service jira start
```

​	