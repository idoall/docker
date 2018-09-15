FROM idoall/ubuntu16.04-golang:1.10.3
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive


ENV V8_VERSION 6.3.292.48.1

# -----------------------------------------------------------------------------
# doit
# -----------------------------------------------------------------------------
RUN mkdir -p `go env GOPATH`/src/github.com/idoall \
    && cd `go env GOPATH`/src/github.com/idoall \
    && git clone https://github.com/idoall/v8.git \
    && cd `go env GOPATH`/src/github.com/idoall/v8 && mkdir data && cd data \
    && curl https://rubygems.org/downloads/libv8-6.3.292.48.1-x86_64-linux.gem > libv8.gem \
    && tar -xf libv8.gem && tar -xzf data.tar.gz \
    && ln -s `go env GOPATH`/src/github.com/idoall/v8/data/vendor/v8/include $GOPATH/src/github.com/idoall/v8/include \
    && ln -s `go env GOPATH`/src/github.com/idoall/v8/data/vendor/v8/out/x64.release $GOPATH/src/github.com/idoall/v8/libv8

RUN apt-get update -y \
    && apt-fast install -y libasound2-dev


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /var/cache/apt/archives/apt-fast/* 