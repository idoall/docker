docker:24.0.2
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd docker/24.0.2

# hack hack hack

# Build
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/docker:24.0.2 \
  -t registry.cn-beijing.aliyuncs.com/mshk/docker:24.0.2 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .

