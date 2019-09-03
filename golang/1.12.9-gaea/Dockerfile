FROM golang:1.12.9
MAINTAINER lion <lion.888@gmail.com>

# Install golint
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

# 安装 gaea
RUN export GOPROXY=https://mirrors.aliyun.com/goproxy/ \
    && mkdir -p $GOPATH/src/github.com/idoall \
    && cd `go env GOPATH`/src/github.com/idoall \
    && git clone https://github.com/idoall/Gaea.git \
    && cd Gaea \
    && GO111MODULE=on go mod tidy \
    && GO111MODULE=on make \
    && cp -r bin/gaea* / \
    && cp -r etc /etc-gaea

ENTRYPOINT [ "/go/src/github.com/idoall/Gaea/bin/gaea -config /go/src/github.com/idoall/Gaea/etc/gaea.ini" ]

# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 13306