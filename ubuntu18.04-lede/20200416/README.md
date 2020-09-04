
docker-ubuntu16.04-golang1.9
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/ubuntu18.04-lede:20200416`](https://hub.docker.com/r/idoall/ubuntu18.04-lede/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

系统分区设置为 `10` G，如有特殊需要可以自己修改。在`./files/usr/src/lede/.config` 文件第 `225` 和 `226` 行，单位是 `MB`
```ini
CONFIG_TARGET_KERNEL_PARTSIZE=32
CONFIG_TARGET_ROOTFS_PARTSIZE=10240
```

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu18.04-lede/20200416

# hack hack hack

# Build
docker build -t idoall/ubuntu18.04-lede:20200416 .

# run
docker run -it --rm \
--name mshk-lede \
--hostname mshk-lede \
idoall/ubuntu18.04-lede:20200416 /bin/bash


# access the contain
docker exec -it mshk-lede /bin/bash
```

# Run
docker run -d --name=mshk-lede idoall/ubuntu18.04-lede:20200416

# access the contain
docker exec -it mshk-lede /bin/bash
```
