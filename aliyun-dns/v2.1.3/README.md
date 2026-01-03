aliyun-dns:v2.1.3
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd aliyun-dns/v2.1.3

# hack hack hack

# Build
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t idoall/aliyun-dns:v2.1.3 \
  -t idoall/aliyun-dns:latest \
  -t registry.cn-beijing.aliyuncs.com/mshk/aliyun-dns:v2.1.3 \
  -t registry.cn-beijing.aliyuncs.com/mshk/aliyun-dns:latest \
  --push \
  --no-cache \
  --provenance=false \
  --sbom=false .

```


