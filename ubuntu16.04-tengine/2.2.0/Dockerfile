FROM idoall/ubuntu16.04-sshd
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /


# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
	&& apt-fast install -y libpcre3 libpcre3-dev openssl libssl-dev


# -----------------------------------------------------------------------------
# nginx
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src /home/work/_app/nginx/conf/conf.d /home/work/_logs/nginx \
	&& cd /home/work/_src \
	&& wget http://tengine.taobao.org/download/tengine-2.2.0.tar.gz \
	&& tar xzvf tengine-2.2.0.tar.gz \
	&& cd tengine-2.2.0 \
	&& ./configure --prefix=/home/work/_app/nginx --with-http_gzip_static_module --with-http_realip_module --with-http_stub_status_module --with-http_concat_module --with-http_ssl_module --with-http_userid_filter_module=shared --with-threads \
	&& make \
    && make install


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /home/work/_src/* \
  	&& chown -R work:work /home/work/*


# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 80