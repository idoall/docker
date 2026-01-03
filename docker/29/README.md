docker:29
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd docker/29

# hack hack hack

# Build
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/docker:29 \
  -t registry.cn-beijing.aliyuncs.com/mshk/docker:29 \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .

