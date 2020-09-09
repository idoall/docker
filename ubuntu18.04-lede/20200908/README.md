
docker-ubuntu16.04-golang1.9
=============


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/ubuntu18.04-lede:20200908`](https://hub.docker.com/r/idoall/ubuntu18.04-lede/)

> A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!

固件使用说明

* 基于Lede OpenWrt 及来自Lienol和若干自行维护的软件包（Feed）
* 结合家庭x86软路由场景需要定制

## Developing

系统分区设置为 `2` G，如有特殊需要可以自己修改。在`./files/usr/src/lede/.config` 文件第 `225` 和 `226` 行，单位是 `MB`
```ini
CONFIG_TARGET_KERNEL_PARTSIZE=32
CONFIG_TARGET_ROOTFS_PARTSIZE=2048
```

本套代码是编译 L 大的 20200908分支版本，第一次完成打包，如需要二次编译可以执行以下命令：
```shell
cd lede
git pull
./scripts/feeds update -a && ./scripts/feeds install -a
make defconfig
make -j8 download
make -j$(($(nproc) + 1)) V=s
```

如果需要重新配置：
```shell
rm -rf ./tmp && rm -rf .config
make menuconfig
make -j$(($(nproc) + 1)) V=s
```
编译完成后输出路径：/lede/bin/targets

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu18.04-lede/20200908

# hack hack hack

# Build
docker build -t idoall/ubuntu18.04-lede:20200908 .

# run
docker run -it --rm \
--name mshk-lede \
--hostname mshk-lede \
idoall/ubuntu18.04-lede:20200908 /bin/bash


# access the contain
docker exec -it mshk-lede /bin/bash
```


