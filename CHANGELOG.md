# 修改日志

## 新增 docker:24.0.2-git 镜像构建

### 修改内容

本次修改新增了一个基于docker:24.0.2-git的Docker镜像构建配置，主要区别如下：

1. **镜像标签**：从 `docker:24.0.2` 变更为 `docker:24.0.2-git`
2. **构建目标**：构建包含git工具的docker镜像，用于需要git功能的开发环境

### 文件变更

- 新增目录 `docker/24.0.2-git/`
- 新增文件 `docker/24.0.2-git/Dockerfile`
- 新增文件 `docker/24.0.2-git/README.md`

### 构建命令

```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/docker:24.0.2-git \
  -t registry.cn-beijing.aliyuncs.com/mshk/docker:24.0.2-git \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .
```

### 使用场景

该镜像适用于需要在Docker容器中使用git命令的开发环境，比如：
- 代码版本控制
- 项目构建脚本执行
- 自动化部署流程
