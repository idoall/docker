FROM idoall/golang:1.12.4
MAINTAINER lion <lion.888@gmail.com>

# COPY files /

RUN go get github.com/idoall/gocryptotrader
RUN go get github.com/idoall/gomail
RUN go get github.com/idoall/hermes
RUN go get github.com/astaxie/beego
RUN go get github.com/go-sql-driver/mysql
RUN go get github.com/gorilla/websocket
RUN go get github.com/json-iterator/go
RUN go get github.com/lestrrat/go-file-rotatelogs \
    && go get github.com/micro/go-api \
    && go get github.com/micro/go-log \
    && go get github.com/micro/go-micro \
    && go get github.com/rifflock/lfshook \
    && go get github.com/sirupsen/logrus \
    && go get github.com/uber/jaeger-client-go \
    && go get golang.org/x/crypto/scrypt
RUN go get github.com/idoall/gods