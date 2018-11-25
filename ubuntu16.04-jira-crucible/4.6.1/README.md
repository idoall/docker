
ubuntu16.04-jira-fisheye:4.6.1
=============



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jira-crucible/4.6.1

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-jira-crucible:4.6.1 .

# Run rm
docker run -it --name=mshk_crucible --rm -p 80:8060 idoall/ubuntu16.04-jira-crucible:4.6.1

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=mshk_crucible -p 80:8060 idoall/ubuntu16.04-jira-crucible:4.6.1

# access the contain
docker exec -it mshk_crucible /bin/bash
```
# Using docker stack deploy service to create APP



When deploying, pay attention to modifying the  `my.ini` in the `docker-compose.yml` file content.



## deploy service

```bash
docker stack deploy -c docker-compose.yml mshk_crucible
```

## remove deploy

```bash
docker stack rm mshk_crucible
```

## view service list

```bash
# 所有服务列表
docker service ls

# 指定应用的列表
docker stack services mshk_crucible
```

## View service status

```bash
watch docker service ps mshk_crucible
```


## Where is the data stored?

The container uses host mounted volumes to store persistent data:
| Local location       | Container location | Usage                                      |
| -------------------- | ------------------ | ------------------------------------------ |
| `/srv/Crucible/Home directory`   | `/home/work/_data/_java_crucible`  | For storing application data               |


# 破解方法

## 1、将需要破解的文件复制出来
```bash
CONTAINERNAME=`docker ps --format "{{.Names}}" | grep mshk_crucible`
docker cp $CONTAINERNAME:/home/work/_app/_java_crucible/lib/atlassian-extras-2.5.jar ./atlassian-extras-2.3.1-SNAPSHOT.jar
docker cp $CONTAINERNAME:/usr/src/_crucible/crucible_keygen.jar .
```

## 2、执行以下命令，打开破解工具
```bash
java -jar crucible_keygen.jar
```

找到复制出来的 `atlassian-extras-2.3.1-SNAPSHOT.jar` 文件，点击`.patch!`，进行破解。这时不要关闭破解工具。

将破解后的文件，复制回容器中。
```bash
docker exec $CONTAINERNAME sh -c '/home/work/_app/_java_crucible/bin/stop.sh;mv /home/work/_app/_java_crucible/lib/atlassian-extras-2.5.jar /home/work/_app/_java_crucible/lib/atlassian-extras-2.5.jar.bak'
docker cp atlassian-extras-2.3.1-SNAPSHOT.jar $CONTAINERNAME:/home/work/_app/_java_crucible/lib/atlassian-extras-2.5.jar
docker exec $CONTAINERNAME sh -c '/home/work/_app/_java_crucible/bin/start.sh'
```

## 3、重新打开浏览器
在页面中选择`Enter existing license`，在刚才打开的破解工具中，输入`Servce ID`，点击`.gen!`，生成Key后，复制到页面中，即可完成破解。