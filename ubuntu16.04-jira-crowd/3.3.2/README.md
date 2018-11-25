
ubuntu16.04-jira-crowd:3.3.2
=============



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jira-crowd/3.3.2

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-jira-crowd:3.3.2 .

# Run rm
docker run -it --name=mshk_crowd --rm -p 80:8095 idoall/ubuntu16.04-jira-crowd:3.3.2

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=mshk_crowd -p 80:8095 idoall/ubuntu16.04-jira-crowd:3.3.2

# access the contain
docker exec -it mshk_crowd /bin/bash
```




## Where is the data stored?

The container uses host mounted volumes to store persistent data:
| Local location       | Container location | Usage                                      |
| -------------------- | ------------------ | ------------------------------------------ |
| `/srv/Crowd/Home directory`   | `/home/work/_data/_jira_crowd`  | For storing application data               |


# Using docker stack deploy service to create APP


When deploying, pay attention to modifying the  `my.ini` in the `docker-compose.yml` file content.



## deploy service

```bash
docker stack deploy -c docker-compose.yml mshk_crowd
```

## remove deploy

```bash
docker stack rm mshk_crowd
```

## view service list

```bash
# 所有服务列表
docker service ls

# 指定应用的列表
docker stack services mshk_crowd
```

## View service status

```bash
watch docker service ps mshk_crowd
```



# 破解方法

## 1、将需要破解的文件复制出来
```bash
CONTAINERNAME=`docker ps --format "{{.Names}}" | grep mshk_crowd_jira_crowd.1`
docker cp $CONTAINERNAME:/home/work/_app/_jira_crowd/crowd-webapp/WEB-INF/lib/atlassian-extras-3.2.jar ./atlassian-extras-2.6.jar
docker cp $CONTAINERNAME:/usr/src/_crowd/crowd_keygen.jar .
```

## 2、执行以下命令，打开破解工具
```bash
java -jar crowd_keygen.jar
```

找到复制出来的 `atlassian-extras-2.6.jar` 文件，点击`.patch!`，进行破解。这时不要关闭破解工具。

将破解后的文件，复制回容器中。
```bash
docker exec $CONTAINERNAME sh -c '/home/work/_app/_jira_crowd/stop_crowd.sh;mv /home/work/_app/_jira_crowd/crowd-webapp/WEB-INF/lib/atlassian-extras-3.2.jar /home/work/_app/_jira_crowd/crowd-webapp/WEB-INF/lib/atlassian-extras-3.2.jar.bak'
docker cp atlassian-extras-2.6.jar $CONTAINERNAME:/home/work/_app/_jira_crowd/crowd-webapp/WEB-INF/lib/atlassian-extras-3.2.jar 
docker exec $CONTAINERNAME sh -c '/home/work/_app/_jira_crowd/start_crowd.sh'
```

## 3、重新打开浏览器
在页面中选择`Set up Crowd`，在刚才打开的破解工具中，输入`Servce ID`，点击`.gen!`，生成Key后，复制到页面中，即可完成破解。