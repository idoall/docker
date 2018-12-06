
ubuntu16.04-golang1.11.2-jira-bamboo:6.7.1
=============


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-golang1.11.2-jira-bamboo/6.7.1

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-golang1.11.2-jira-bamboo:6.7.1 .

# Run rm
docker run -it --name=mshk_bamboo --rm -p 80:8085 idoall/ubuntu16.04-golang1.11.2-jira-bamboo:6.7.1

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=mshk_bamboo -p 80:8085 idoall/ubuntu16.04-golang1.11.2-jira-bamboo:6.7.1

# access the contain
docker exec -it mshk_bamboo /bin/bash
```



# Using docker stack deploy service to create APP


When deploying, pay attention to modifying the  `my.ini` in the `docker-compose.yml` file content.



## deploy service

```bash
docker stack deploy -c docker-compose.yml mshk_bamboo
```

## remove deploy

```bash
docker stack rm mshk_bamboo
```

## view service list

```bash
# 所有服务列表
docker service ls

# 指定应用的列表
docker stack services mshk_bamboo
```

## View service status

```bash
watch docker service ps mshk_bamboo
```


## Where is the data stored?

The container uses host mounted volumes to store persistent data:
| Local location       | Container location | Usage                                      |
| -------------------- | ------------------ | ------------------------------------------ |
| `/srv/Bamboo/Home directory`   | `/home/work/_data/_java_bamboo`  | For storing application data               |
