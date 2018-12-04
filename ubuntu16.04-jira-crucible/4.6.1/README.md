
ubuntu16.04-jira-crucible:4.6.1
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
| `/srv/Crucible/Home directory`   | `/home/work/_data/_jira_crucible`  | For storing application data               |


# Related Articles

[Docker 创建 Crucible4.6.1 以及与 Crowd3.3.2 实现 SSO 单点登录](https://mshk.top/2018/12/docker-crucible-crowd-sso/)

