FROM idoall/nginx:1.9
MAINTAINER lion <lion.net@163.com>



# -----------------------------------------------------------------------------
# 安装PHP 56
# -----------------------------------------------------------------------------
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm \
    && rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm \
    && yum update -y \
    && yum clean all \
    && yum makecache \
    \
# -----------------------------------------------------------------------------
# 安装PHP 56
# -----------------------------------------------------------------------------
    && yum install -y php56w php56w-cli php56w-fpm php56w-opcache php56w-gd php56w-devel php56w-bcmath  php56w-imap php56w-mbstring php56w-mcrypt php56w-mysql php56w-odbc php56w-pdo php56w-pear php56w-pecl-geoip php56w-pecl-imagick php56w-pecl-memcache php56w-xml php56w-xmlrpc php56w-opcache php56w-intl php56w-pecl-redis php56w-pecl-memcache php56w-pecl-memcached php56w-soap \
    \
# -----------------------------------------------------------------------------
# 修改配置文件
# -----------------------------------------------------------------------------
    && mkdir -p /home/work/_logs/php \
    && sed -i "s/;date.timezone =.*/date.timezone = Asia\/Shanghai/" /etc/php.ini \
    && sed -i "s/error_log = \/var\/log\/php-fpm\/error.log/error_log = \/home\/work\/_logs\/php\/php-fpm.error.log/" /etc/php-fpm.conf \
    && sed -i "s/user = apache/user = work/" /etc/php-fpm.d/www.conf \
    && sed -i "s/group = apache/group = work/" /etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.owner = nobody/listen.owner = work/" /etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.group = nobody/listen.group = work/" /etc/php-fpm.d/www.conf \
    && sed -i "s/;listen.mode = 0666/listen.mode = 0666/" /etc/php-fpm.d/www.conf \
    && sed -i "s/;catch_workers_output = yes/catch_workers_output = yes/" /etc/php-fpm.d/www.conf \
    && sed -i "s/php_admin_value\[error_log\] = \/var\/log\/php-fpm\/www-error.log/php_admin_value\[error_log\] = \/home\/work\/_logs\/php\/php-fpm.www.log/" /etc/php-fpm.d/www.conf \
    && sed -i "s/;request_slowlog_timeout = 0/request_slowlog_timeout = 15s/" /etc/php-fpm.d/www.conf \
    && sed -i "s/slowlog = \/var\/log\/php-fpm\/www-slow.log/slowlog = \/home\/work\/_logs\/php\/fpm-php.slow.log/" /etc/php-fpm.d/www.conf \
    \
    && echo "<?php  phpinfo();  ?>" > /home/work/_app/nginx/html/index.php \
    \
# -----------------------------------------------------------------------------
# 删除多余文件
# -----------------------------------------------------------------------------
    && yum clean all \
    && rm -rf /home/work/_src/*




# -----------------------------------------------------------------------------
# 修改 Nginx 的配置文件支持 PHP，并配置默认站点
# -----------------------------------------------------------------------------
ADD _app/nginx/conf/nginx.conf /home/work/_app/nginx/conf/nginx.conf
ADD _app/nginx/conf/conf.d/default.conf /home/work/_app/nginx/conf/conf.d/default.conf

# -----------------------------------------------------------------------------
# 添加执行文件
# -----------------------------------------------------------------------------
ADD run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]



