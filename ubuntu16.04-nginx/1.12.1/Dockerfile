FROM idoall/ubuntu16.04-sshd
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive

ENV NGINX_VERSION 1.12.1

COPY files/ /


# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
	&& apt-fast install -y libpcre3 libpcre3-dev openssl libssl-dev libxml2 libxslt1-dev libgd-dev libgeoip-dev


# -----------------------------------------------------------------------------
# nginx
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src /home/work/_app/nginx/conf/conf.d /home/work/_logs/nginx \
	&& cd /home/work/_src \
	&& axel -n 10 -o /home/work/_src/nginx.tgz http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz \
	&& echo '8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb /home/work/_src/nginx.tgz' | sha256sum -c - \
	&& tar xzvf nginx.tgz \
	&& cd nginx-$NGINX_VERSION/ \
	&& ./configure --prefix=/home/work/_app/nginx --user=work --group=work --with-http_gzip_static_module --with-http_realip_module --with-http_stub_status_module --with-http_ssl_module --with-threads --with-http_v2_module --with-http_geoip_module --with-http_image_filter_module --with-http_xslt_module \
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