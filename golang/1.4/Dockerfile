FROM idoall/supervisor:1.9
MAINTAINER lion <lion.net@163.com>


# -----------------------------------------------------------------------------
# 下载 golang1.4 并编译
# -----------------------------------------------------------------------------
RUN set -eux \
	&& cd /home/work/_src \
	&& wget -O go.tgz https://storage.googleapis.com/golang/go1.4-bootstrap-20170531.tar.gz \
	&& echo '49f806f66762077861b7de7081f586995940772d29d4c45068c134441a743fa2 *go.tgz' | sha256sum -c - \
	&& tar -C /home/work/_app -xzf /home/work/_src/go.tgz \
	&& cd /home/work/_app/go/src \
	&& ./make.bash \
	&& mv /home/work/_app/go /home/work/_app/go1.4 \
	&& cd /home/work/_src \
	&& mkdir -p golang/src \
	&& mkdir -p golang/pkg \
	&& mkdir -p golang/bin \
	&& rm -rf /home/work/_src/go.tgz \
	\
# -----------------------------------------------------------------------------
# 安装 git
# -----------------------------------------------------------------------------
	&& yum install -y git


ENV GOPATH /home/work/_src/golang
ENV GOROOT /home/work/_app/go1.4
ENV GOROOT_BOOTSTRAP $GOROOT
ENV GOBIN $GOROOT/bin
ENV PATH $GOBIN:$PATH