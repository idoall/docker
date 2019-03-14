FROM idoall/centos:7.6
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /

ENV NGINX_VERSION 1.14.2

# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN yum update -y \
	&& yum install -y gcc gcc-c++ pcre-devel openssl openssl-devel libxml2 libxml2-dev libxslt-devel gd-devel GeoIP GeoIP-devel GeoIP-data 


# -----------------------------------------------------------------------------
# nginx
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src /home/work/_app/nginx/conf/conf.d /home/work/_logs/nginx \
	&& cd /home/work/_src \
	&& axel -n 10 -o /home/work/_src/nginx.tgz http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz \
	&& tar xzvf nginx.tgz \
	&& cd nginx-$NGINX_VERSION/ \
	&& ./configure --prefix=/home/work/_app/nginx --user=work --group=work --with-http_gzip_static_module --with-http_realip_module --with-http_stub_status_module --with-http_ssl_module --with-threads --with-http_v2_module --with-http_geoip_module --with-http_image_filter_module --with-http_xslt_module \
	&& make && make install


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
    && chown -R work:work /home/work/* \
    && yum clean all \
    && rm -rf /home/work/_src/*


# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 80