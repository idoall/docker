
ubuntu16.04-jdk10-confluence6.12.2
=============


# 相关文章
[Docker创建Confluence6.12.2 中文破解版](https://mshk.top/2018/11/docker-confluence-6-12-2/)

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jdk10-confluence/6.12.2

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-jdk10-confluence:6.12.2 .

# Run rm
docker run -it --name=idoall_confluence --rm -p 80:8090 idoall/ubuntu16.04-jdk10-confluence:6.12.2

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=idoall_confluence -p 80:8090 idoall/ubuntu16.04-jdk10-confluence:6.12.2

# access the contain
docker exec -it idoall_confluence /bin/bash
```
# Using docker stack deploy service to create APP



When deploying, pay attention to modifying the  `my.ini` in the `docker-compose.yml` file content.



## deploy service

```bash
docker stack deploy -c docker-compose.yml mshk_confluence
```

## remove deploy

```bash
docker stack rm mshk_confluence
```

## view service list

```bash
# 所有服务列表
docker service ls

# 指定应用的列表
docker stack services mshk_confluence
```

## View service status

```bash
watch docker service ps mshk_confluence
```
