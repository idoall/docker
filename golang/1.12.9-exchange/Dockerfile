FROM idoall/golang:1.12.9
MAINTAINER lion <lion.888@gmail.com>

# COPY files /

RUN apk add --no-cache \
		git
RUN go get github.com/idoall/gomail
RUN go get github.com/idoall/hermes
RUN go get github.com/astaxie/beego
RUN go get github.com/go-sql-driver/mysql
RUN go get github.com/gorilla/websocket
RUN go get github.com/json-iterator/go
RUN go get github.com/lestrrat/go-file-rotatelogs
RUN go get github.com/micro/go-api
RUN go get github.com/micro/go-log
RUN go get github.com/micro/go-micro
RUN go get github.com/rifflock/lfshook
RUN go get github.com/sirupsen/logrus
RUN go get github.com/uber/jaeger-client-go
RUN go get golang.org/x/crypto/scrypt
RUN go get github.com/idoall/gods
RUN go get github.com/agtorre/gocolorize
RUN go get github.com/idoall/gocryptotrader
RUN go get github.com/beego/bee


# 安装 TokenExchangeCommon
RUN cd `go env GOPATH`/src/github.com/idoall \
    && rm -rf TokenExchangeCommon \
    && git clone https://github.com/idoall/TokenExchangeCommon

# 安装 v8
RUN cd `go env GOPATH`/src/github.com/idoall \
    && git clone https://github.com/idoall/v8 \
    && cd `go env GOPATH`/src/github.com/idoall/v8 \
    && mkdir data && cd data \
    && curl https://rubygems.org/downloads/libv8-6.3.292.48.1-x86_64-linux.gem > libv8.gem \
    && tar -xf libv8.gem && tar -xzf data.tar.gz \
    && ln -s `go env GOPATH`/src/github.com/idoall/v8/data/vendor/v8/include $GOPATH/src/github.com/idoall/v8/include \
    && ln -s `go env GOPATH`/src/github.com/idoall/v8/data/vendor/v8/out/x64.release $GOPATH/src/github.com/idoall/v8/libv8