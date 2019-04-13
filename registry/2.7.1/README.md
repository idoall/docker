# docker-registry2.5.1
为了便于使用，将默认端口从5000改为80


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd registry/2.7.1

# hack hack hack

# build
docker build -t idoall/registry:2.7.1 .

# run
docker run -it \
--rm \
--name registry \
--hostname registry \
-p 80:80 \
idoall/registry:2.7.1

# view
curl localhost/v2/_catalog
```



## Where is the data stored? 

The container uses host mounted volumes to store persistent data:

| Local location         | Container location                       |
| ---------------------- | ---------------------------------------- |
| `/srv/registry_folder` | `/var/lib/registry` |


更多配置请参考：https://docs.docker.com/registry/configuration/