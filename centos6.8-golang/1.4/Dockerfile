FROM idoall/centos:6.8
MAINTAINER lion <lion.net@163.com>


# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
RUN yum makecache \
	&& yum install -y gcc gcc-c++


# -----------------------------------------------------------------------------
# 下载 golang1.4 并编译
# -----------------------------------------------------------------------------
RUN set -eux \
	&& mkdir -p /home/work/_src /home/work/_project \
	&& axel -n 10 -o /home/work/_src/go.tgz https://storage.googleapis.com/golang/go1.4-bootstrap-20170531.tar.gz \
	&& echo "49f806f66762077861b7de7081f586995940772d29d4c45068c134441a743fa2  /home/work/_src/go.tgz" | sha256sum -c \
	&& tar -C /home/work/_app -xzf /home/work/_src/go.tgz \
	&& cd /home/work/_app/go/src \
	&& ./make.bash \
	&& mv /home/work/_app/go /home/work/_app/go1.4 \
	&& mkdir -p /home/work/_project/golang/src /home/work/_project/golang/pkg /home/work/_project/golang/bin


# -----------------------------------------------------------------------------
# 安装 git
# -----------------------------------------------------------------------------
RUN yum update -y \
	&& yum install -y git


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& yum clean all \
  	&& rm -rf /home/work/_src/*


ENV GOPATH /home/work/_project/golang
ENV GOROOT /home/work/_app/go1.4
ENV GOROOT_BOOTSTRAP $GOROOT
ENV GOBIN $GOROOT/bin
ENV PATH $GOBIN:$PATH