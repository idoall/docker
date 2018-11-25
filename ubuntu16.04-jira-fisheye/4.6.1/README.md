
ubuntu16.04-jira-bamboo:6.7.1
=============


# 相关文章


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jira-fisheye/4.6.1

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-ira-fisheye:4.6.1 .

# Run rm
docker run -it --name=mshk_fisheye --rm -p 80:8060 idoall/ubuntu16.04-ira-fisheye:4.6.1

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=mshk_fisheye -p 80:8060 idoall/ubuntu16.04-ira-fisheye:4.6.1

# access the contain
docker exec -it mshk_fisheye /bin/bash
```
# Using docker stack deploy service to create APP



When deploying, pay attention to modifying the  `my.ini` in the `docker-compose.yml` file content.



## deploy service

```bash
docker stack deploy -c docker-compose.yml mshk_fisheye
```

## remove deploy

```bash
docker stack rm mshk_fisheye
```

## view service list

```bash
# 所有服务列表
docker service ls

# 指定应用的列表
docker stack services mshk_fisheye
```

## View service status

```bash
watch docker service ps mshk_fisheye
```


## Where is the data stored?

The container uses host mounted volumes to store persistent data:
| Local location       | Container location | Usage                                      |
| -------------------- | ------------------ | ------------------------------------------ |
| `/srv/Bamboo/Home directory`   | `/home/work/_data/_java_bamboo`  | For storing application data               |
