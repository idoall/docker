# Alpine/3.9.3



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd alpine/3.9.3

# hack hack hack

# build
docker build -t idoall/alpine:3.9.3 .
```

## 安装

### 单节点安装

```bash
# run
docker run -it \
--rm \
--name alpine \
idoall/alpine:3.9.3 date
# Mon Apr 15 18:08:08 CST 2019


# access the contain
docker run -it \
--rm \
--name alpine \
idoall/alpine:3.9.3 /bin/ash
```
