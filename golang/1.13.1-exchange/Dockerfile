FROM idoall/golang:1.13.1-alpine3.10.2
MAINTAINER lion <lion.888@gmail.com>

# COPY files /
RUN go env -w GOPROXY=https://goproxy.cn,https://mirrors.aliyun.com/goproxy/,https://goproxy.io,direct

# beego/bee 目前不支持 go mod ,所以引用 github.com/realguan/bee 来解决
# RUN go env -w GO111MODULE=on 
# go env -w GOSUMDB=off


# go-micro 使用 go mod 有些问题，https://github.com/micro/go-micro/issues/758
RUN go env -w GOSUMDB=off \
    && go get -v github.com/micro/go-micro
RUN go env -w GOSUMDB=sum.golang.org \
    && go get -v github.com/idoall/gomail \
    && go get -v github.com/idoall/hermes/v2@v2.0.2.1 \
    && go get -v github.com/astaxie/beego \
    && go get -v github.com/go-sql-driver/mysql \
    && go get -v github.com/gorilla/websocket \
    && go get -v github.com/json-iterator/go \
    && go get -v github.com/lestrrat/go-file-rotatelogs \
    && go get -v github.com/micro/go-api \
    && go get -v github.com/micro/go-log \
    && go get -v github.com/rifflock/lfshook \
    && go get -v github.com/sirupsen/logrus \
    && go get -v github.com/uber/jaeger-client-go \
    && go get -v golang.org/x/crypto/scrypt \
    && go get -v github.com/idoall/gods \
    && go get -v github.com/agtorre/gocolorize \
    && go get -v github.com/idoall/gocryptotrader \
    && go get -v github.com/idoall/TokenExchangeCommon \
    && go get -v github.com/idoall/v8 \
    # && go get -v github.com/beego/bee
    && go get -v github.com/realguan/bee

RUN go get -v github.com/micro/go-micro

# 安装 TokenExchangeCommon
# RUN cd `go env GOPATH`/src/github.com/idoall \
#     && rm -rf TokenExchangeCommon \
#     && git clone https://github.com/idoall/TokenExchangeCommon


# 安装 v8
RUN cd `go env GOPATH`/src/github.com/idoall \
    && git clone https://github.com/idoall/v8 \
    && cd `go env GOPATH`/src/github.com/idoall/v8 \
    && mkdir data && cd data \
    && curl https://rubygems.org/downloads/libv8-6.3.292.48.1-x86_64-linux.gem > libv8.gem \
    && tar -xf libv8.gem && tar -xzf data.tar.gz \
    && ln -s `go env GOPATH`/pkg/mod/github.com/idoall/v8@v8.0.0-*/data/vendor/v8/include $GOPATH/pkg/mod/github.com/idoall/v8@v8.0.0-*/include \
    && ln -s `go env GOPATH`/src/github.com/idoall/v8/data/vendor/v8/out/x64.release $GOPATH/src/github.com/idoall/v8/libv8

# V8PATH=$GOPATH/pkg/mod/github.com/idoall/`ls $GOPATH/pkg/mod/github.com/idoall/ | grep v8`
    # ln -s $V8PATH/data/vendor/v8/include $V8PATH/include \
    # && ln -s $V8PATH/data/vendor/v8/out/x64.release $V8PATH/libv8