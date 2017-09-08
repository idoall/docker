FROM idoall/nginx:1.9
MAINTAINER lion <lion.net@163.com>


# -----------------------------------------------------------------------------
# 更新 centos
# -----------------------------------------------------------------------------
RUN yum update -y \
    \
# -----------------------------------------------------------------------------
# 安装基础组件 
# -----------------------------------------------------------------------------    
    && yum install -y libjpeg libjpeg-devel libpng curl-devel libpng-devel freetype bzip2-devel freetype-devel libxml2 libxml2-devel pcre-devel ncurses-devel openssl openssl-devel php-mcrypt libmcrypt libmcrypt-devel \
    && ln -s /usr/lib64/libssl.so /usr/lib/ \
    \
# -----------------------------------------------------------------------------
# 升级bison
# -----------------------------------------------------------------------------  
RUN cd /home/work/_src \
    && wget http://ftp.gnu.org/gnu/bison/bison-2.6.5.tar.gz \
    && tar -xvzf bison-2.6.5.tar.gz  \
    && cd bison-2.6.5 \
    && ./configure \
    && make && make install \
    \
# -----------------------------------------------------------------------------
# centos源不能安装libmcrypt-devel，由于版权的原因没有自带mcrypt的包
# ----------------------------------------------------------------------------- 
    && cd /home/work/_src \
    && wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/attic/libmcrypt/libmcrypt-2.5.7.tar.gz \
    && tar -zxvf libmcrypt-2.5.7.tar.gz \
    && cd libmcrypt-2.5.7 \
    && ./configure  --prefix=/usr/local \
    && make && make install \
    \
# -----------------------------------------------------------------------------
# 下载 php 7.1.9
# -----------------------------------------------------------------------------    
    && cd /home/work/_src \  
    && wget http://cn2.php.net/distributions/php-7.1.9.tar.gz \
    && tar xzvf php-7.1.9.tar.gz \
    && cd php-7.1.9 \
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
    && cp /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf.default /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    \
# -----------------------------------------------------------------------------
# 修改配置文件
# -----------------------------------------------------------------------------   
    && mkdir -p /home/work/_logs/php \
    && sed -i "s/;date.timezone =.*/date.timezone = Asia\/Shanghai/" /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i 's/;session.save_path = .*/session.save_path = "\/home\/work\/_app\/php7.1.9\/session"/' /home/work/_app/php7.1.9/etc/php.ini \
    && sed -i "s/;error_log = log\/php-fpm.log/error_log = \/home\/work\/_logs\/php\/php-fpm.error.log/" /home/work/_app/php7.1.9/etc/php-fpm.conf \
    && sed -i "s/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/user = nobody/user = work/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/group = nobody/group = work/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.owner = nobody/listen.owner = work/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.group = work/listen.group = work/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.mode = 0660/listen.mode = 0666/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;access.log = log\/\$pool.access.log/access.log = \/home\/work\/_logs\/php\/php.\$pool.access.log/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;slowlog = log\/\$pool.log.slow/slowlog = \/home\/work\/_logs\/php\/fpm-php.slow.log/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;request_slowlog_timeout = 0/request_slowlog_timeout = 10s/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    && sed -i "s/;php_admin_value\[error_log\] = \/var\/log\/fpm-php.www.log/php_admin_value\[error_log\] = \/home\/work\/_logs\/php\/php-fpm.www.log/" /home/work/_app/php7.1.9/etc/php-fpm.d/www.conf \
    \
    && echo "<?php  phpinfo();  ?>" > /home/work/_app/nginx/html/index.php \
    \
# -----------------------------------------------------------------------------
# 删除多余文件
# -----------------------------------------------------------------------------
    && yum clean all \
    && rm -rf /home/work/_src/* \
    \
# -----------------------------------------------------------------------------
# 设置work目录的用户和用户组
# -----------------------------------------------------------------------------
    && chown -R work:work /home/work/* \
    && export PATH=$PATH:/home/work/_app/php7.1.9/bin:/home/work/_app/php7.1.9/sbin



# -----------------------------------------------------------------------------
# 修改 Nginx 的配置文件支持 PHP，并配置默认站点
# -----------------------------------------------------------------------------
ADD _app/nginx/conf/nginx.conf /home/work/_app/nginx/conf/nginx.conf
ADD _app/nginx/conf/conf.d/default.conf /home/work/_app/nginx/conf/conf.d/default.conf

ENV PATH $PATH:/home/work/_app/php7.1.9/bin:/home/work/_app/php7.1.9/sbin

# -----------------------------------------------------------------------------
# 添加执行文件
# -----------------------------------------------------------------------------
ADD run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]


