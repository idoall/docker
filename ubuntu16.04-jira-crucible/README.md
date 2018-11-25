
ubuntu16.04-jira-crucible
=============

This repository contains the sources for the following [idoall/ubuntu:16.04](https://hub.docker.com/r/idoall/ubuntu/) base images:
- [`ubuntu16.04-jira-crucible:4.6.1`(*4.6.1/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-jira-crucible/4.6.1/Dockerfile)



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jira-crucible/<tab>

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-jira-crucible:<tab> .

# Run rm
docker run -it --name=mshk_crucible --rm -p 80:8060 idoall/ubuntu16.04-jira-crucible:<tab>

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=mshk_crucible -p 80:8060 idoall/ubuntu16.04-jira-crucible:<tab>

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

