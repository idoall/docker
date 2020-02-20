k8s-helm:2.13.1
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd k8s-helm/3.0.0/alpine3.11.3-source

# hack hack hack

# Build
docker build -t idoall/k8s-helm:3.0.0-alpine3.11.3-source .

# Run After running, wait for 1 minutes.
# Open http://localhost/ in your browser
$ docker run -it --rm \
--name=helm \
idoall/k8s-helm:3.0.0-alpine3.11.3-source \
helm version

# access the contain
$ docker run -it --rm \
--name=helm \
-v ~/.kube/config:/root/.kube/config \
idoall/k8s-helm:3.0.0-alpine3.11.3-source \
helm list
NAME                  	REVISION	UPDATED                 	STATUS  	CHART                       	APP VERSION	NAMESPACE
consul                	1       	Sun May  5 21:13:16 2019	DEPLOYED	consul-3.6.1                	1.0.0      	default

```

# Note

当使用 `update-ca-certificates` 提示错误时，可以使用下面的方法忽略错误
```
$ update-ca-certificates 2>/dev/null || true
```