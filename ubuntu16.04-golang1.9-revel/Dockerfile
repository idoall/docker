FROM idoall/ubuntu16.04-golang:1.9
MAINTAINER lion <lion.net@163.com>


COPY files/ /

# -----------------------------------------------------------------------------
# Quick Start revel
# -----------------------------------------------------------------------------
RUN cd $GOPATH \
    && go get -u github.com/revel/cmd/revel \
    && revel new github.com/idoall.org/my-app \
    && sed -i "s/http.port = 9000/http.port = 8080/" $GOPATH/src/github.com/idoall.org/my-app/conf/app.conf

# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 80 8080
