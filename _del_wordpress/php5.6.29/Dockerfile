FROM idoall/nginx-php:php5.6.29
MAINTAINER lion <lion.net@163.com>


ENV WORDPRESS_VERSION 4.8.1

# -----------------------------------------------------------------------------
# 安装 wordpress 4.8.1
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
    && curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz" \
    && rm -rf /home/work/_app/nginx/html/index.* \
    && tar -xzf wordpress.tar.gz -C /home/work/_app/nginx/html \
    && mv /home/work/_app/nginx/html/wordpress/* /home/work/_app/nginx/html \
    && rm -rf /home/work/_srcwordpress.tar.gz /home/work/_app/nginx/html/wordpress \
    && chown -R work:work /home/work/_app/nginx/html


# -----------------------------------------------------------------------------
# 添加执行文件
# -----------------------------------------------------------------------------
COPY wordpress-init.sh /home/work/_script/wordpress-init.sh
ADD run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]