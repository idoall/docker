gitlab-ce:11.3.9-ce.0
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd gitlab-ce/11.3.9-ce.0

# hack hack hack

# Build
docker build -t idoall/gitlab-ce:11.3.9-ce.0 .

# Run After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d \
--name=mshk_gitlab \
-p 80:80 -p 443:443 -p 22:22 \
idoall/gitlab-ce:11.3.9-ce.0

# access the contain
docker exec -it mshk_gitlab /bin/bash

# 汉化
wget https://gitlab.com/xhang/gitlab/-/archive/11-3-stable-zh/gitlab-11-3-stable-zh.tar.bz2
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
When updating the Docker image you may encounter an issue where all paths display the infamous 500 page. If this occurs, try to run `sudo docker restart mshk_gitlab` gitlab to restart the container and rectify the issue.

## Permission problems
When updating from older GitLab Docker images you might encounter permission problems. This happens due to a fact that users in previous images were not preserved correctly. There’s script that fixes permissions for all files.

To fix your container, simply execute `update-permissions` and restart the container afterwards:
```bash
docker exec mshk_gitlab update-permissions
docker restart mshk_gitlab
```

## Linux ACL issues
If these are not correct, set them with: 
```bash
$ sudo setfacl -mR default:group:docker:rwx /srv/gitlab
```

# 汉化方法

汉化的命令，都是在容器内部执行

## 1、登录到容器内部，执行以下命令，安装patch工具：
```bash
apt-get update -y \
&& apt-get install -y patch
```

## 2、执行以下命令后，在执行`patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < ../11.3.9-zh.diff`命令后，会提示一路回车，按到底。
```bash
cd /tmp \
&& git clone https://gitlab.com/xhang/gitlab.git \
&& gitlab-ctl stop \
&& cd gitlab \
&& git diff v11.3.9 v11.3.9-zh > ../11.3.9-zh.diff \
&& patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < ../11.3.9-zh.diff
```
## 3、重启容器
```bash
gitlab-ctl start \
&& apt-get -y clean \
&& rm -rf /var/lib/apt/lists/*
```
