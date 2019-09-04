FROM idoall/golang:1.12.9
MAINTAINER lion <lion.888@gmail.com>


COPY files/ /

ENV GAEA_VERSION v1.0.1

# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
# RUN apk add alpine-sdk git
RUN apk add --no-cache \
    git \
    make \
    gcc \
    g++

# 安装 gaea
# RUN export GOPROXY=https://mirrors.aliyun.com/goproxy/ \
RUN mkdir -p $GOPATH/src/github.com/idoall \
    && cd `go env GOPATH`/src/github.com/idoall \
    && git clone https://github.com/idoall/Gaea.git \
    && cd Gaea \
    && git checkout $GAEA_VERSION \
    && GO111MODULE=on go mod tidy \
    && GO111MODULE=on make \
    && cp -r bin/gaea* / \
    && cp -r etc /etc-gaea

# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 13306


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
  	&& rm -rf /home/work/_src/* /var/cache/apk/*
	
