FROM idoall/nginx-php
MAINTAINER lion <lion.net@163.com>



# -----------------------------------------------------------------------------
# 安装 composer 1.2.4
# -----------------------------------------------------------------------------
ADD composer1.2.4.phar /home/work/_src/composer.phar
RUN cd /home/work/_src/ \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

# -----------------------------------------------------------------------------
# 安装 ansible
# -----------------------------------------------------------------------------
RUN yum update \
    && yum install -y ansible

# -----------------------------------------------------------------------------
# 安装 walle-web 1.2.0
# -----------------------------------------------------------------------------
ADD walle-web-1.2.0.tar.gz /home/work/_site/
ADD _site /home/work/_site
RUN cd /home/work/_site/walle-web-1.2.0 \
    && composer install --prefer-dist --no-dev --optimize-autoloader -vvvv

# -----------------------------------------------------------------------------
# 删除多余文件
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_script/ \
    && yum clean all \
    && rm -rf /home/work/_src/* \
    && chown -R work:work /home/work/*

# -----------------------------------------------------------------------------
# 复制启动命令
# -----------------------------------------------------------------------------
COPY walle-web-init.sh /home/work/_script/walle-web-init.sh
RUN chmod 777 /home/work/_script/walle-web-init.sh

# -----------------------------------------------------------------------------
# 设置 Nginx 站点目录
# -----------------------------------------------------------------------------
ADD _app /home/work/_app