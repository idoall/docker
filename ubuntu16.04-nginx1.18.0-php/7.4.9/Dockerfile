FROM idoall/ubuntu16.04-nginx:1.18.0
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /

ENV PHP_VERSION 7.4.9

# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
	&& apt-fast install -y imagemagick graphicsmagick libxml2 libxml2-dev libcurl3-openssl-dev libjpeg-dev libpng-dev libfreetype6-dev libmcrypt-dev pkg-config libsqlite3-dev autoconf automake libtool libwebp-dev libzip-dev git libmemcached-dev  \
	&& ln -s /usr/lib/x86_64-linux-gnu/libssl.so  /usr/lib

# -----------------------------------------------------------------------------
# 安装 oniguruma (PHP 7.4.x中mbstring的正则表达式功能需要oniguruma)
# -----------------------------------------------------------------------------
RUN wget https://github.com/kkos/oniguruma/archive/v6.9.4.tar.gz -O oniguruma-6.9.4.tar.gz \
    && tar -zxvf oniguruma-6.9.4.tar.gz \
    && cd oniguruma-6.9.4 \
    && ./autogen.sh \
    && ./configure \
    && make && make install

# -----------------------------------------------------------------------------
# 安装 PHP 
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
    && wget http://cn2.php.net/distributions/php-$PHP_VERSION.tar.gz -O /home/work/_src/php.tgz \
    && tar xzvf php.tgz \
    && cd php-$PHP_VERSION \
    && ./configure --prefix=/home/work/_app/php$PHP_VERSION \
--with-config-file-path=/home/work/_app/php$PHP_VERSION/etc \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-freetype \
--with-jpeg \
--with-webp \
--enable-gd \
--with-iconv \
--with-zlib \
--enable-xml \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-inline-optimization \
--enable-mbregex \
--enable-fpm \
--enable-mbstring \
--enable-ftp \
--with-openssl \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--with-zip \
--enable-soap \
--without-pear \
--with-gettext \
--enable-session \
--with-curl \
--enable-opcache \
	&& make && make install \
    && cp php.ini-production /home/work/_app/php$PHP_VERSION/etc/php.ini \
    && cp /home/work/_app/php$PHP_VERSION/etc/php-fpm.conf.default /home/work/_app/php$PHP_VERSION/etc/php-fpm.conf \
    && cp /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf.default /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    \
# -----------------------------------------------------------------------------
# 修改配置文件
# -----------------------------------------------------------------------------   
    && mkdir -p /home/work/_logs/php /home/work/_app/php$PHP_VERSION/session \
    && chmod o=rwx -R /home/work/_app/php$PHP_VERSION/session \
    && sed -i "s/pdo_mysql.default_socket=/pdo_mysql.default_socket=\/tmp\/mysql.sock/" /home/work/_app/php$PHP_VERSION/etc/php.ini \
    && sed -i "s/;date.timezone =.*/date.timezone = Asia\/Shanghai/" /home/work/_app/php$PHP_VERSION/etc/php.ini \
    && sed -i 's/max_execution_time = 30/max_execution_time = 300/g' /home/work/_app/php$PHP_VERSION/etc/php.ini \
    && sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 256M/g' /home/work/_app/php$PHP_VERSION/etc/php.ini \
    && sed -i 's/post_max_size = 8M/post_max_size = 512M/g' /home/work/_app/php$PHP_VERSION/etc/php.ini \
    && sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /home/work/_app/php$PHP_VERSION/etc/php.ini \
    && sed -i 's/;session.save_path = .*/session.save_path = "\/home\/work\/_app\/php$PHP_VERSION\/session"/' /home/work/_app/php$PHP_VERSION/etc/php.ini \
    && sed -i "s/;error_log = log\/php-fpm.log/error_log = \/home\/work\/_logs\/php\/php-fpm.error.log/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.conf \
    && sed -i "s/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/user = nobody/user = work/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/group = nobody/group = work/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.owner = nobody/listen.owner = work/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.group = work/listen.group = work/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.mode = 0660/listen.mode = 0666/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/;access.log = log\/\$pool.access.log/access.log = \/home\/work\/_logs\/php\/php.access.log/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/;slowlog = log\/\$pool.log.slow/slowlog = \/home\/work\/_logs\/php\/fpm-php.slow.log/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/;request_slowlog_timeout = 0/request_slowlog_timeout = 10s/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i "s/;php_admin_value\[error_log\] = \/var\/log\/fpm-php.www.log/php_admin_value\[error_log\] = \/home\/work\/_logs\/php\/php-fpm.www.log/" /home/work/_app/php$PHP_VERSION/etc/php-fpm.d/www.conf \
    && sed -i -e 's/fastcgi_param  SERVER_PORT        $server_port;/fastcgi_param  SERVER_PORT        $http_x_forwarded_port;/g' /home/work/_app/nginx/conf/fastcgi.conf \
    && sed -i -e 's/fastcgi_param  SERVER_PORT        $server_port;/fastcgi_param  SERVER_PORT        $http_x_forwarded_port;/g' /home/work/_app/nginx/conf/fastcgi_params \
    && echo "<?php  phpinfo();  ?>" > /home/work/_app/nginx/html/index.php


# -----------------------------------------------------------------------------
# 安装 php-redis
# ----------------------------------------------------------------------------- 
RUN export PATH=$PATH:/home/work/_app/php$PHP_VERSION/bin:/home/work/_app/php$PHP_VERSION/sbin \
    && cd /home/work/_src \
    && git clone https://github.com/phpredis/phpredis.git \
    && cd phpredis \
    && phpize \
    && ./configure \
    && make && make install \
    && echo "extension=redis.so" >> /home/work/_app/php$PHP_VERSION/etc/php.ini


# -----------------------------------------------------------------------------
# 安装 php-memcached
# ----------------------------------------------------------------------------- 
RUN export PATH=$PATH:/home/work/_app/php$PHP_VERSION/bin:/home/work/_app/php$PHP_VERSION/sbin \
    && cd /home/work/_src \
    && git clone https://github.com/php-memcached-dev/php-memcached.git \
    && cd php-memcached \
    && git checkout v3.1.5 \
    && phpize \
    && ./configure \
    && make && make install \
    && echo "extension=memcached.so" >> /home/work/_app/php$PHP_VERSION/etc/php.ini

# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /var/cache/apt/archives/apt-fast/* \
  	&& rm -rf /home/work/_src/*

# -----------------------------------------------------------------------------
# 设置变量
# -----------------------------------------------------------------------------
ENV PATH $PATH:/home/work/_app/php$PHP_VERSION/bin:/home/work/_app/php$PHP_VERSION/sbin



