
ubuntu16.04-jiracore
=============


# 相关文章
[Docker 创建 Jira Core 7.12.3 中文破解版](https://mshk.top/2018/11/docker-jira-7-12-3/)

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jira/7.12.3

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-jira:7.12.3 .

# Run rm
docker run -it --name=idoall_jira --rm -p 80:8080 idoall/ubuntu16.04-jira:7.12.3 /bin/bash

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=idoall_jira -p 80:8080 idoall/ubuntu16.04-jira:7.12.3

# access the contain
docker exec -it idoall_jira /bin/bash
```
# Using docker stack deploy service to create APP



When deploying, pay attention to modifying the  `my.ini` in the `docker-compose.yml` file content.



## deploy service

```bash
docker stack deploy -c docker-compose.yml mshk_jira
```

## remove deploy

```bash
docker stack rm mshk_jira
```

## view service list

```bash
# 所有服务列表
docker service ls

# 指定应用的列表
docker stack services mshk_jira
```

## View service status

```bash
watch docker service ps mshk_jira
```
