k8s-helm:2.3.1
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd k8s-helm/2.3.1

# hack hack hack

# Build
docker build -t idoall/k8s-helm:2.3.1 .

# Run After running, wait for 1 minutes.
# Open http://localhost/ in your browser
$ docker run -it --rm \
--name=helm \
idoall/k8s-helm:2.3.1 \
helm version

# access the contain
$ docker run -it --rm \
--name=helm \
-v ~/.kube/config:/root/.kube/config \
idoall/k8s-helm:2.3.1 \
helm list
NAME                  	REVISION	UPDATED                 	STATUS  	CHART                       	APP VERSION	NAMESPACE
consul                	1       	Sun May  5 21:13:16 2019	DEPLOYED	consul-3.6.1                	1.0.0      	default

# 汉化
wget https://gitlab.com/xhang/gitlab/-/archive/11-3-stable-zh/gitlab-11-3-stable-zh.tar.bz2
```

