FROM idoall/ubuntu16.04-nginx1.18.0-php:7.4.9
MAINTAINER lion <lion.net@163.com>

COPY files/ /

ENV WORDPRESS_VERSION 5.5.1

# -----------------------------------------------------------------------------
# 安装 wordpress
# -----------------------------------------------------------------------------
RUN curl -o /home/work/_src/wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz" \
    && rm -rf /home/work/_app/nginx/html/index.* \
    && tar -xzf /home/work/_src/wordpress.tar.gz -C /home/work/_app/nginx/html \
    && mv /home/work/_app/nginx/html/wordpress/* /home/work/_app/nginx/html


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /var/cache/apt/archives/apt-fast/* \
  	&& rm -rf /home/work/_src/*

