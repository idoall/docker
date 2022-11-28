gitlab-runner:alpine3.15-v15.6.1
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd gitlab-runner/alpine3.15-v15.6.1

# hack hack hack

# Build
docker build -t idoall/gitlab-runner:alpine3.15-v15.6.1 .

```


# GitLab Runner Docker images

**We don't monitor the comments here, if you need help with running this GitLab Runner Docker image, please see https://about.gitlab.com/getting-help/**

`gitlab/gitlab-runner:latest` is image that can be used to run GitLab Runner in container.

- The complete usage guide can be found in the [GitLab Runner Docs](https://docs.gitlab.com/runner/install/docker.html)



# 配合gitlab-ce使用docker方式运行gitlab-runner

/home/work/_app/gitlab-runner/config.toml
```
listen_address = "[::]:9252"
concurrent = 10
check_interval = 30
log_level = "info"
```

以 docker run-d 方式启动
```
docker run -d --name gitlab-runner --restart always \
    --privileged \
    -v /home/work/_app/gitlab-runner:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    registry.cn-beijing.aliyuncs.com/mshk/gitlab-runner:alpine3.15-v15.6.1
```

向 gitlab-ce 中进行注册,替换`TokenString`为在 gitlab-ce 申请的 Token
```
CONTAINERNAME=`docker ps --format "{{.Names}}" | grep gitlab-runner`
docker exec -it ${CONTAINERNAME} \
    gitlab-runner register \
    --non-interactive \
    --url https://xxx.cn/ \
    --registration-token TokenString \
    --executor docker \
    --description "Gitlab Runner by lion" \
    --docker-image "registry.cn-beijing.aliyuncs.com/mshk/docker:17.09-dind" \
    --tag-list "build-golang, build-node, deploy-dev, deploy-production, deploy-qa" \
    --docker-privileged=true \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"
```

查看注册后的配置文件
```
$ docker exec $CONTAINERNAME sh -c 'cat /etc/gitlab-runner/config.toml'
```

删除 gitlab-RUNNER 容器
```
$ docker ps -a | grep "gitlab-runner" | awk '{print $1 }'|xargs docker stop
$ docker ps -a | grep "gitlab-runner" | awk '{print $1 }'|xargs docker rm
```

登录到 容器中进行注册
```
$ CONTAINERNAME=`docker ps --format "{{.Names}}" | grep gitlab-runner`
$ docker exec -it $CONTAINERNAME gitlab-runner register
Enter the GitLab instance URL (for example, https://gitlab.com/):
https://xxx.xxx.xxx/
Enter the registration token:
GR13489413refH_a9bMDPxr9y
Enter a description for the runner:
[gitlab_runner]: Gitlab Runner by lion
Enter tags for the runner (comma-separated):
build-golang, build-node, deploy-production
Enter optional maintenance note for the runner:

Registering runner... succeeded                     runner=GR13489413refH6N4
Enter an executor: virtualbox, docker+machine, docker-ssh+machine, kubernetes, docker-ssh, parallels, shell, instance, custom, docker, ssh:
shell
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!

Configuration (with the authentication token) was saved in "/etc/gitlab-runner/config.toml"
```