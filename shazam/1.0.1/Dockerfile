FROM idoall/golang:1.12.9 AS builder
MAINTAINER lion <lion.888@gmail.com>

ENV SHAZAM_VERSION v1.0.1

# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
# RUN apk add alpine-sdk git
RUN apk add --no-cache \
    git \
    make \
    gcc \
    g++

# 安装 shazam
RUN export GOPROXY=https://mirrors.aliyun.com/goproxy/ \
    && mkdir -p $GOPATH/src/github.com/idoall \
# RUN mkdir -p $GOPATH/src/github.com/idoall \
    && cd `go env GOPATH`/src/github.com/idoall \
    && git clone https://github.com/idoall/shazam.git \
    && cd shazam \
    && git checkout $SHAZAM_VERSION \
    && GO111MODULE=on go mod tidy \
    && GO111MODULE=on make

RUN cp -r $GOPATH/src/github.com/idoall/shazam/bin/gaea* / \
    && cp -r $GOPATH/src/github.com/idoall/shazam/etc /etc-gaea

# -----------------------------------------------------------------------------
# Build
# -----------------------------------------------------------------------------
FROM idoall/alpine:3.10.2
COPY files/ /
COPY --from=builder /gaea* /home/work/_app/_shazam/
COPY --from=builder /etc-gaea /home/work/_app/_shazam/etc
RUN sed -i "s/config_type=etcd/config_type=file/" /home/work/_app/_shazam/etc/gaea.ini

# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 13306
