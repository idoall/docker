FROM idoall/supervisor:1.9
MAINTAINER Docker lion <lion.net@163.com>

ENV GOLANG_VERSION 1.7.4



# -----------------------------------------------------------------------------
# 由于G.F.W的原因，国内只能做成包的形式
# -----------------------------------------------------------------------------
COPY go$GOLANG_VERSION.src.tar.gz /
COPY go-release-branch.go1.4.zip /


# -----------------------------------------------------------------------------
# 1.4是最后一个用gcc来编译的版本,go 1.5实现了自举（即用go本身来编译）
# -----------------------------------------------------------------------------
RUN unzip /go-release-branch.go1.4.zip -d /home/work \
    && mv /home/work/go-release-branch.go1.4 /home/work/go \
    && cd /home/work/go/src \
    && ./make.bash \
    && mv /home/work/go /home/work/go1.4 \
    && cd /home/work && mkdir -p golang/src && mkdir -p golang/pkg && mkdir -p golang/bin \
    \
# -----------------------------------------------------------------------------
# 编译安装go 1.7.4
# -----------------------------------------------------------------------------
    && tar -C /home/work -xzf /go$GOLANG_VERSION.src.tar.gz \
    && cd /home/work/go/src \
# -----------------------------------------------------------------------------
# 编译安装go 1.7.4-------golang设置环境变量
# -----------------------------------------------------------------------------
    && HOME=/home/work \
    && GOPATH=/home/work/golang \
    && GOROOT=/home/work/go \
    && GOBIN=/home/work/go/bin \
    && ./make.bash


# -----------------------------------------------------------------------------
# 设置 golang 的环境变量
# -----------------------------------------------------------------------------
ENV GOPATH /home/work/golang
ENV GOROOT /home/work/go
ENV GOBIN $GOROOT/bin
ENV PATH $GOBIN:$PATH


# -----------------------------------------------------------------------------
# 由于G.F.W的原因，国内只能做成包的形式
# -----------------------------------------------------------------------------
ADD golang.tar.gz /home/work
# -----------------------------------------------------------------------------
# 生成revel二进制命令
# -----------------------------------------------------------------------------
RUN go install github.com/revel/cmd/revel \
    \
# -----------------------------------------------------------------------------
# Create a new app
# -----------------------------------------------------------------------------
    && cd /home/work/golang \
    && revel new github.com/idoall.org/my-app \
    && sed -i "s/http.port = 9000/http.port = 80/" /home/work/golang/src/github.com/idoall.org/my-app/conf/app.conf \
    \
# -----------------------------------------------------------------------------
# 删除一些多余的东西
# -----------------------------------------------------------------------------
    && rm -rf /go$GOLANG_VERSION.src.tar.gz /go-release-branch.go1.4.zip \
    && rm -rf /home/work/go1.4 /home/work/_script /home/work/_src \
    && yum clean all

# -----------------------------------------------------------------------------
# 通过 supervisor 启动 revel
# -----------------------------------------------------------------------------
#ADD _app/supervisord/conf.d/idoall.org.ini /home/work/_app/supervisord/conf.d/idoall.org.ini


# -----------------------------------------------------------------------------
# 添加执行文件
# -----------------------------------------------------------------------------
ADD run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]
