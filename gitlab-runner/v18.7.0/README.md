gitlab-runner:alpine-v18.7.0
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd gitlab-runner/v18.7.0

# hack hack hack

# Build
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/gitlab-runner:v18.7.0 \
  -t registry.cn-beijing.aliyuncs.com/mshk/gitlab-runner:v18.7.0 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .

```


# GitLab Runner Docker images

**We don't monitor the comments here, if you need help with running this GitLab Runner Docker image, please see https://about.gitlab.com/getting-help/**

`gitlab/gitlab-runner:latest` is image that can be used to run GitLab Runner in container.

- The complete usage guide can be found in the [GitLab Runner Docs](https://docs.gitlab.com/runner/install/docker.html)