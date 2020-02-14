gitlab-runner:alpine-v11.10.0
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd gitlab-runner/alpine-v11.10.0

# hack hack hack

# Build
docker build -t idoall/gitlab-runner:alpine-v11.10.0 .


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
 -v /home/work/_app/gitlab-runner:/etc/gitlab-runner \
 -v /var/run/docker.sock:/var/run/docker.sock \
 registry.cn-beijing.aliyuncs.com/mshk/gitlab-runner:alpine-v11.10.0
```

向 gitlab-ce 中进行注册
```
CONTAINERNAME=`docker ps --format "{{.Names}}" | grep gitlab-runner`
docker exec $CONTAINERNAME sh -c 'gitlab-runner register --non-interactive --url "https://zzxxx/" --registration-token "token" --description "gitlab-ce-alpine:3.10.2" --executor "docker" --tag-list "build-golang, build-node, deploy-dev, deploy-production, deploy-qa" --docker-image registry.cn-beijing.aliyuncs.com/mshk/alpine:3.10.2'
```