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
watch docker service ps mshk_gitlab_gitlab
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
When updating the Docker image you may encounter an issue where all paths display the infamous 500 page. If this occurs, try to run `sudo docker restart` gitlab to restart the container and rectify the issue.

## Permission problems
When updating from older GitLab Docker images you might encounter permission problems. This happens due to a fact that users in previous images were not preserved correctly. There’s script that fixes permissions for all files.

To fix your container, simply execute `update-permissions` and restart the container afterwards:
```bash
sudo docker exec gitlab update-permissions
sudo docker restart gitlab
```

## Linux ACL issues
If these are not correct, set them with: 
```bash
$ sudo setfacl -mR default:group:docker:rwx /srv/gitlab
```
