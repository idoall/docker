gitlab-ce:11.10.0-ce.0
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd gitlab-ce/11.10.0-ce.0

# hack hack hack

# Build
docker build -t idoall/gitlab-ce:11.10.0-ce.0 .

# Run After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d \
--name=mshk_gitlab \
-p 80:80 -p 443:443 -p 22:22 \
idoall/gitlab-ce:11.11.0-ce.0

# access the contain
docker exec -it mshk_gitlab /bin/bash

# 汉化
wget https://gitlab.com/xhang/gitlab/-/archive/11-3-stable-zh/gitlab-11-3-stable-zh.tar.bz2
```



# docker-compose

使用 docker-compose 设置 gitlab-ce 和 runner 的方法

## 使用方法

* 使用 `docker-compose up` 启动
* 等待几十秒，浏览 http://localhost:20050
* 使用 `root` 用户登录，在 `Admin Area` 页面，左侧 `Overview` -> 点击 `Runners`，在右侧找到你的 `registration token` 对所有项目使用公共的 `runner`;也可以在 `http://GITLAB_HOST/$PROJECT_GROUP/$PROJECT_NAME/settings/ci_cd` 中找到项目的 `registration token` 对项目使用单独的 `runner`
* 在每个 `runner` 容器中运行命令，进行注册 `docker exec -it 11100-ce0_mshk_gitlab-runner1_1 gitlab-runner register -n -r $REGISTRATION_TOKEN -u http://GITLAB_HOST/ --executor docker --docker-image docker:latest --description "My Docker Runner1" --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"`

## 批量注册脚本
类似下面这样
```bash
REGISTRATION_TOKEN=FdQBq_WesbFQxeDxq1yj
docker exec -it 11100-ce0_mshk_gitlab-runner1_1 gitlab-runner register -n -r $REGISTRATION_TOKEN -u http://GITLAB_HOST/ --executor docker --docker-image idoall/golang:1.12.4 --tag-list "test" --description "My Docker Runner1" --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"
docker exec -it 11100-ce0_mshk_gitlab-runner2_1 gitlab-runner register -n -r $REGISTRATION_TOKEN -u http://GITLAB_HOST/ --executor docker --docker-image idoall/golang:1.12.4 --tag-list "build" --description "My Docker Runner2" --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"
docker exec -it 11100-ce0_mshk_gitlab-runner3_1 gitlab-runner register -n -r $REGISTRATION_TOKEN -u http://GITLAB_HOST/ --executor docker --docker-image idoall/golang:1.12.4 --tag-list "deploy-production,deploy" --description "My Docker Runner3" --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"
```

注册成功后会看到类似下面的信息
```
...
Runtime platform                                    arch=amd64 os=linux pid=17 revision=3001a600 version=11.10.0
Running in system-mode.

Registering runner... succeeded                     runner=PsQBq_We
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!
```

如果提示类似下面的信息不用担心，这是因为 `runner` 容器没有注册，注册以后就不会出现了
```
mshk_gitlab-runner3_1  | ERROR: Failed to load config stat /etc/gitlab-runner/config.toml: no such file or directory  builds=0
mshk_gitlab-runner2_1  | ERROR: Failed to load config stat /etc/gitlab-runner/config.toml: no such file or directory  builds=0
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

## 2、执行以下命令后
```bash
cd /tmp \
&& git clone https://gitlab.com/xhang/gitlab.git \
&& gitlab-ctl stop \
&& cd gitlab \
&& git diff v11.10.0 v11.10.0-zh > ../11.10.0-zh.diff \
&& patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < ../11.10.0-zh.diff
```
> 有提示的时候一直按 `y` 确认到最后

## 3、重启容器
```bash
gitlab-ctl start \
&& apt-get -y clean \
&& rm -rf /var/lib/apt/lists/*
```
