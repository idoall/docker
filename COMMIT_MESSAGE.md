# GitLab 提交修改内容整理

## 修改概览

本次提交主要添加了以下内容：

1. 新增阿里云 DNS 镜像构建目录
2. 新增 Docker 29-rc-dind 镜像构建
3. 新增 GitLab CE 18.7.0 版本镜像构建
4. 新增 GitLab Runner 18.7.0 版本镜像构建
5. 新增 GitLab Runner Helper 18.7.1 版本镜像构建

## 详细修改内容

### 1. 阿里云 DNS 镜像 (aliyun-dns)
- 新增目录结构
- 包含 v2.1.3 版本目录

### 2. Docker 29-rc-dind 镜像 (docker/29-rc-dind)
- 新增 Dockerfile
- 新增 README.md

### 3. GitLab CE 18.7.0 镜像 (gitlab-ce/18.7.0-ce.0)
- 新增 Dockerfile
- 新增 docker-compose.yml
- 新增 docker-compose.3.6.yml
- 新增 README.md
- 新增 example.gitlab-ci.yml
- 新增 gitlab.rb
- 新增 root_password.txt
- 新增 .env

### 4. GitLab Runner 18.7.0 镜像 (gitlab-runner/v18.7.0)
- 新增 Dockerfile
- 新增 README.md

### 5. GitLab Runner Helper 18.7.1 镜像 (gitlab-runner-helper/v18.7.1)
- 新增 Dockerfile
- 新增 README.md

## 说明

这些修改主要是为了：
- 增加新的 Docker 镜像构建支持
- 更新 GitLab 相关组件到最新版本
- 提供完整的构建配置文件
- 为团队提供标准的镜像构建模板

## 注意事项

请确保在使用这些镜像前检查对应的配置文件，并根据实际环境进行调整。
