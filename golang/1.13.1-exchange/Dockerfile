FROM idoall/golang:1.13.1-alpine3.10.2
MAINTAINER lion <lion.888@gmail.com>


RUN apk add --no-cache \
		git \
		curl \
        gcc

RUN go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,https://goproxy.cn,https://goproxy.io,direct

# go-micro 使用 go mod 有些问题，https://github.com/micro/go-micro/issues/758
RUN go env -w GO111MODULE=on \
    && go env -w GOSUMDB=off \
    && go get -v github.com/micro/go-micro

# beego/bee 目前不支持 go mod ,所以引用 github.com/franzwilhelm/bee 来解决
RUN git clone https://github.com/franzwilhelm/bee.git $GOPATH/src/github.com/beego/bee \
    && GO111MODULE=off go install $GOPATH/src/github.com/beego/bee

RUN go env -w GO111MODULE=on \
    && go env -w GOSUMDB=sum.golang.org \
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
    && go get -v github.com/idoall/TokenExchangeCommon

# 安装 v8
RUN cd $GOPATH/pkg/mod/github.com/idoall \
    && git clone https://github.com/idoall/v8 \
    && cd $GOPATH/pkg/mod/github.com/idoall/v8 \
    && mkdir data && cd data \
    && curl https://rubygems.org/downloads/libv8-6.3.292.48.1-x86_64-linux.gem > libv8.gem \
    && tar -xf libv8.gem && tar -xzf data.tar.gz \
    && V8PATH=$GOPATH/pkg/mod/github.com/idoall/`ls $GOPATH/pkg/mod/github.com/idoall/ | grep v8` \
    && ln -s $V8PATH/data/vendor/v8/include $V8PATH/include \
    && ln -s $V8PATH/data/vendor/v8/out/x64.release $V8PATH/libv8


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
  	&& rm -rf /home/work/_src/* /var/cache/apk/*