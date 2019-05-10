gitlab-ce
=============


This repository contains the sources for the following [gitlab/gitlab-ce](https://hub.docker.com/r/gitlab/gitlab-ce/) base images:
- [`gitlab-ce:9.3.6-ce.0`(*9.3.6-ce.0/Dockerfile*)](https://github.com/idoall/docker/blob/master/gitlab-ce/9.3.6-ce.0/Dockerfile)
- [`gitlab-ce:11.4.6-ce.0`(*11.4.6-ce.0/Dockerfile*)](https://github.com/idoall/docker/blob/master/gitlab-ce/11.4.6-ce.0/Dockerfile)
- [`gitlab-ce:11.10.0-ce.0`(*11.10.0-ce.0/Dockerfile*)](https://github.com/idoall/docker/blob/master/gitlab-ce/11.10.0-ce.0/Dockerfile)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd gitlab-ce/tag

# hack hack hack

# Build
docker build -t idoall/gitlab-ce:tag .

# Run After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d \
--name=mshk_gitlab \
-p 80:80 -p 443:443 -p 22:22 \
idoall/gitlab-ce:tag

# access the contain
docker exec -it mshk_gitlab /bin/bash
```



# Using docker stack deploy service to create APP



## deploy service

```bash
docker stack deploy -c docker-compose.yml mshk_gitlab
```

## remove deploy

```bash
docker stack rm mshk_gitlab
```

## view service list

```bash
# 所有服务列表
docker service ls

# 指定应用的列表
docker stack services mshk_gitlab
```

## View service status

```bash
watch docker service ps mshk_gitlab_mshk_gitlab
```

## Where is the data stored?

The GitLab container uses host mounted volumes to store persistent data:
| Local location       | Container location | Usage                                      |
| -------------------- | ------------------ | ------------------------------------------ |
| `/srv/gitlab/data`   | `/var/opt/gitlab`  | For storing application data               |
| `/srv/gitlab/logs`   | `/var/log/gitlab`  | For storing logs                           |
| `/srv/gitlab/config` | `/etc/gitlab`      | For storing the GitLab configuration files |


# Troubleshooting

## 500 Internal Error
When updating the Docker image you may encounter an issue where all paths display the infamous 500 page. If this occurs, try to run `sudo docker restart mshk_gitlab` gitlab to restart the container and rectify the issue.

## Permission problems
When updating from older GitLab Docker images you might encounter permission problems. This happens due to a fact that users in previous images were not preserved correctly. There’s script that fixes permissions for all files.

To fix your container, simply execute `update-permissions` and restart the container afterwards:
```bash
docker exec mshk_gitlab update-permissions
docker restart mshk_gitlab
docker exec $CONTAINERNAME sh -c 'gitlab-ctl stop unicorn && gitlab-ctl stop sidekiq && gitlab-ctl start'
```

## Linux ACL issues
If these are not correct, set them with: 
```bash
$ sudo setfacl -mR default:group:docker:rwx /srv/gitlab
```
