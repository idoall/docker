FROM idoall/ubuntu:18.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /

# -----------------------------------------------------------------------------
# 下载 Ubuntu 基础软件包
# -----------------------------------------------------------------------------
RUN apt-fast update \
    && apt-fast -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget swig rsync libjansson-dev
    # zstd libpcre3


# -----------------------------------------------------------------------------
# 更新 LEDE 软件包
# -----------------------------------------------------------------------------
# RUN cd /home/work/_src/lede \
#     && echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default \
#     && echo "src-git small https://github.com/kenzok8/small" >> feeds.conf.default \
#     && echo "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default \
#     && ./scripts/feeds clean && ./scripts/feeds update -a && ./scripts/feeds install -a \
#     && make defconfig

# RUN echo "copying banner" \
#     && cp -r /src/lede/banner /home/work/_src/lede/package/base-files/files/etc/banner \
#     && echo "copying feeds.conf.default" \
#     && cp -r /src/lede/feeds.conf.default /home/work/_src/lede/feeds.conf.default
#     && echo "copying iproute2" \
#     && cp -r /src/lede/package/network/utils/iproute2/Makefile /home/work/_src/lede/package/network/utils/iproute2/Makefile



# -----------------------------------------------------------------------------
# 修复包里面的错误
# -----------------------------------------------------------------------------
# RUN sed -i "s/PKG_VERSION).tar.zst/PKG_VERSION).tar.gz/" /home/work/_src/lede/package/feeds/packages/zstd/Makefile \
#     && sed -i "s/PKG_HASH\:=2c2366874bc449ff539614266d8c0d6ecdb4baf30bb65609c239ab4ed23c03c7/PKG_HASH\:=skip/" /home/work/_src/lede/package/feeds/packages/zstd/Makefile



# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks /src/lede \
	&& chown -R work:work /home/work/* /hooks /src/lede \
	&& apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /var/cache/apt/archives/apt-fast/*
      


# -----------------------------------------------------------------------------
# Define default user.
# -----------------------------------------------------------------------------
USER work

# -----------------------------------------------------------------------------
# 下载 LEDE 源码包
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src/ \
    && cd /home/work/_src/ \
    && git clone https://github.com/coolsnowwolf/lede


# -----------------------------------------------------------------------------
# 修改配置文件
# -----------------------------------------------------------------------------
RUN echo "copying .config" \
    && cp -r /src/lede/.config /home/work/_src/lede/ \
    && echo "copying banner" \
    && cp -r /src/lede/banner /home/work/_src/lede/package/base-files/files/etc/banner \
    && echo "copying feeds.conf.default" \
    && cp -r /src/lede/feeds.conf.default /home/work/_src/lede/feeds.conf.default
    # && echo "copying iproute2" \
    # && cp -r /src/lede/package/network/utils/iproute2/Makefile /home/work/_src/lede/package/network/utils/iproute2/Makefile


# -----------------------------------------------------------------------------
# 更新 LEDE 软件包
# -----------------------------------------------------------------------------
RUN cd /home/work/_src/lede \
    && ./scripts/feeds update -a && ./scripts/feeds install -a

# -----------------------------------------------------------------------------
# 下载 dl 库
# -----------------------------------------------------------------------------
RUN cd /home/work/_src/lede \
    && export GOPROXY=https://goproxy.cn,https://mirrors.aliyun.com/goproxy/,https://proxy.golang.org/,direct \
    && make -j8 download V=s


# -----------------------------------------------------------------------------
# 编译固件
# -----------------------------------------------------------------------------
RUN cd /home/work/_src/lede \
    && make -j1 V=s

# -----------------------------------------------------------------------------
# Define working directory.
# -----------------------------------------------------------------------------
WORKDIR /home/work/_src/lede