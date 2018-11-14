FROM idoall/ubuntu16.04-tengine:2.2
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /

ENV PHP_VERSION 7.1.9

# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
	&& apt-fast install -y imagemagick graphicsmagick libxml2 libxml2-dev libcurl3-openssl-dev libjpeg-dev libpng-dev libfreetype6-dev libmcrypt-dev \
	&& ln -s /usr/lib/x86_64-linux-gnu/libssl.so  /usr/lib

# -----------------------------------------------------------------------------
# 安装 PHP 
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \  
	&& axel -n 10 -o /home/work/_src/php.tgz http://cn2.php.net/distributions/php-$PHP_VERSION.tar.gz \
    && tar xzvf php.tgz \
    && cd php-$PHP_VERSION \
    && ./configure --prefix=/home/work/_app/php7.1.9 \
--with-config-file-path=/home/work/_app/php7.1.9/etc \
--with-mcrypt=/usr/include \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-gd \
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
--enable-gd-native-ttf \
--with-openssl \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--enable-zip \
--enable-soap \
--without-pear \
--with-gettext \
--enable-session \
--with-curl \
--with-jpeg-dir \
--with-freetype-dir \
--enable-opcache \
	&& make && make install \
    && cp php.ini-production /home/work/_app/php7.1.9/etc/php.ini \
    && cp /home/work/_app/php7.1.9/etc/php-fpm.conf.default /home/work/_app/php7.1.9/etc/php-fpm.conf \
    && cp /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf.default /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf

# -----------------------------------------------------------------------------
# 修改配置文件
# -----------------------------------------------------------------------------   
RUN mkdir -p /home/work/_logs/php \
    && sed -i "s/;date.timezone =.*/date.timezone = Asia\/Shanghai/" /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i 's/max_execution_time = 30/max_execution_time = 300/g' /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i 's/pdo_mysql.default_socket=/pdo_mysql.default_socket=\/tmp\/mysqld.sock/g' /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 256M/g' /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i 's/post_max_size = 8M/post_max_size = 512M/g' /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i 's/;session.save_path = .*/session.save_path = "\/home\/work\/_app\/php7.1.9\/session"/' /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i "s/;error_log = log\/php-fpm.log/error_log = \/home\/work\/_logs\/php\/php-fpm.error.log/" /home/work/_app/php7.1.9/etc/php-fpm.conf \
    && sed -i "s/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/user = nobody/user = work/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/group = nobody/group = work/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.owner = nobody/listen.owner = work/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.group = work/listen.group = work/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.mode = 0660/listen.mode = 0666/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;access.log = log\/\$pool.access.log/access.log = \/home\/work\/_logs\/php\/php.access.log/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;slowlog = log\/\$pool.log.slow/slowlog = \/home\/work\/_logs\/php\/fpm-php.slow.log/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;request_slowlog_timeout = 0/request_slowlog_timeout = 10s/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;php_admin_value\[error_log\] = \/var\/log\/fpm-php.www.log/php_admin_value\[error_log\] = \/home\/work\/_logs\/php\/php-fpm.www.log/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i -e 's/fastcgi_param  SERVER_PORT        $server_port;/fastcgi_param  SERVER_PORT        $http_x_forwarded_port;/g' /home/work/_app/nginx/conf/fastcgi.conf \
    && sed -i -e 's/fastcgi_param  SERVER_PORT        $server_port;/fastcgi_param  SERVER_PORT        $http_x_forwarded_port;/g' /home/work/_app/nginx/conf/fastcgi_params \
    && echo "<?php  phpinfo();  ?>" > /home/work/_app/nginx/html/index.php


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
ENV PATH $PATH:/home/work/_app/php7.1.9/bin:/home/work/_app/php7.1.9/sbin



