FROM idoall/golang:1.4
MAINTAINER lion <lion.net@163.com>


ENV GOLANG_VERSION 1.9

# -----------------------------------------------------------------------------
# 下载 golang
# -----------------------------------------------------------------------------
RUN set -eux \
	&& cd /home/work/_src \
	&& wget -O go.tgz "https://storage.googleapis.com/golang/go$GOLANG_VERSION.src.tar.gz" \
	&& echo 'a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993 *go.tgz' | sha256sum -c - \
	&& tar -C /home/work/_app -xzf /home/work/_src/go.tgz \
	&& cd /home/work/_app/go/src \
	&& export GOPATH=/home/work/_src/golang \
	&& export GOROOT=/home/work/_app/go1.4 \
	&& export GOOS="$(go env GOOS)" \
	&& export GOARCH="$(go env GOARCH)" \
	&& export GO386="$(go env GO386)" \
	&& export GOARM="$(go env GOARM)" \
	&& export GOHOSTOS="$(go env GOHOSTOS)" \
	&& export GOHOSTARCH="$(go env GOHOSTARCH)" \
	&& export GOROOT_BOOTSTRAP=/home/work/_app/go1.4 \
	&& export GOBIN=$GOROOT/bin \
	&& ./bootstrap.bash \
	&& ./make.bash \
	&& cd /home/work/_app \
	&& mv /home/work/_app/go /home/work/_app/go$GOLANG_VERSION \
	&& rm -rf /home/work/_app/go-linux-amd64-bootstrap.tbz \
	&& rm -rf /home/work/_src/go.tgz \
	\
# -----------------------------------------------------------------------------
# 重新设置环境变更
# -----------------------------------------------------------------------------
	&& export GOROOT=/home/work/_app/go$GOLANG_VERSION

ENV GOPATH /home/work/_src/golang
ENV GOROOT /home/work/_app/go$GOLANG_VERSION
ENV GOBIN $GOROOT/bin
ENV PATH /home/work/_app/go$GOLANG_VERSION/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin