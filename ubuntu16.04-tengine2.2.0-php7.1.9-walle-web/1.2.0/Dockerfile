FROM idoall/ubuntu16.04-tengine2.2.0-php:7.1.9
MAINTAINER lion <lion.net@163.com>


ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /

ENV WALLE_VERSION 1.2.0

# -----------------------------------------------------------------------------
# 安装 git、svn、ansible
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
	&& apt-fast install -y git subversion ansible

# -----------------------------------------------------------------------------
# 安装 composer
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src/ \
	&& cd /home/work/_src/ \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer


# -----------------------------------------------------------------------------
# 安装 walle-web、vendor
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
	&& wget -O walle.tgz https://github.com/meolu/walle-web/archive/v$WALLE_VERSION.tar.gz \
	&& tar xzvf walle.tgz \
	&& mv walle-web-$WALLE_VERSION/* /home/work/_app/nginx/html \
	&& cd /home/work/_app/nginx/html \
	&& composer install --prefer-dist --no-dev --optimize-autoloader -vvvv


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks /home/work/_script/* \
    && chown -R work:work /home/work/* \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/apt-fast/* \
    && rm -rf /home/work/_src/*
