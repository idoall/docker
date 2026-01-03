gitlab-runner-helper:alpine-latest-x86_64-v18.7.1
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd gitlab-runner-helper/v18.7.1

# hack hack hack

# Build
docker buildx build \
  --platform linux/amd64 \
  -t idoall/gitlab-runner-helper:alpine-latest-x86_64-v18.7.1 \
  -t registry.cn-beijing.aliyuncs.com/mshk/gitlab-runner-helper:alpine-latest-x86_64-v18.7.1 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .

```

