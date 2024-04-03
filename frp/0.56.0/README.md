golang 1.22.0
=============

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd frp/0.56.0

# hack hack hack

# Build frps
docker build -f Dockerfile-for-frps -t idoall/frps:0.56.0 .

# Build frpc
docker build -f Dockerfile-for-frpc -t idoall/frpc:0.56.0 .


# view golang version
docker run -it \
--rm \
--name frps \
idoall/frps:0.56.0 \
/usr/bin/frps --version


# run frps
docker run -it \
--rm \
--name frps \
#-v /Users/xxx/my_project/_docker/frp/0.56.0/docker/server/frps.ini:/frps.ini \
--hostname frps \
idoall/frps:0.56.0

# run frpc
docker run -it \
--rm \
--name frpc \
--hostname frpc \
idoall/frpc:0.56.0


```
