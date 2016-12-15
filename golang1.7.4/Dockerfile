FROM alpine:3.4
MAINTAINER Docker lion <lion.net@163.com>

ENV GOLANG_VERSION 1.7.4

# copy golang
COPY go$GOLANG_VERSION.src.tar.gz /
COPY go-release-branch.go1.4.zip /



RUN mkdir -p /home/work \
    \
    && apk add --no-cache ca-certificates \
    \
    && set -ex \
    \
    && apk add --no-cache --virtual .build-deps \
        bash \
        gcc \
        musl-dev \
        openssl \
    \
# 1.4是最后一个用gcc来编译的版本,go 1.5实现了自举（即用go本身来编译）
    && unzip /go-release-branch.go1.4.zip -d /home/work \
    && mv /home/work/go-release-branch.go1.4 /home/work/go \
    && cd /home/work/go/src \
    && ./make.bash \
    && mv /home/work/go /home/work/go1.4 \
    && cd /home/work && mkdir -p golang/src && mkdir -p golang/pkg && mkdir -p golang/bin \
    \
# 编译安装go 1.7.4
    && tar -C /home/work -xzf /go$GOLANG_VERSION.src.tar.gz \
    && cd /home/work/go/src \
# 编译安装go 1.7.4-------golang设置环境变量
    && HOME=/home/work \
    && GOPATH=/home/work/golang \
    && GOROOT=/home/work/go \
    && GOBIN=/home/work/go/bin \
    && ./make.bash \
    \
# 删除一些多余的东西
    && rm -rf /go$GOLANG_VERSION.src.tar.gz /go-release-branch.go1.4.zip \
    && rm -rf /home/work/go1.4

#    && apk del .build-deps



ENV GOPATH /home/work/golang
ENV GOROOT /home/work/go
ENV GOBIN $GOROOT/bin
ENV PATH $GOBIN:$PATH


WORKDIR /home/work
