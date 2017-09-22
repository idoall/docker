FROM idoall/centos6.8-sshd
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /


# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN yum update -y \
	&& yum install -y gcc gcc-c++ pcre-devel openssl openssl-devel


# -----------------------------------------------------------------------------
# nginx
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src /home/work/_app/nginx/conf/conf.d /home/work/_logs/nginx \
	&& cd /home/work/_src \
	&& axel -n 10 -o tengine-2.2.0.tar.gz http://tengine.taobao.org/download/tengine-2.2.0.tar.gz \
	&& tar xzvf tengine-2.2.0.tar.gz \
	&& cd tengine-2.2.0 \
	&& ./configure --prefix=/home/work/_app/nginx --with-http_gzip_static_module --with-http_realip_module --with-http_stub_status_module --with-http_concat_module --with-http_ssl_module --with-http_userid_filter_module=shared --with-threads \
	&& make \
    && make install


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