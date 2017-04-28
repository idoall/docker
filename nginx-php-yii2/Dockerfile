FROM idoall/nginx-php:1.9
MAINTAINER lion <lion.net@163.com>


# -----------------------------------------------------------------------------
# 按Yii2格式调整目录
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_app/nginx/html/web \
    && mv /home/work/_app/nginx/html/*.php /home/work/_app/nginx/html/web \
    && mv /home/work/_app/nginx/html/*.html /home/work/_app/nginx/html/web

# -----------------------------------------------------------------------------
# 修改 Nginx 的配置文件支持 PHP，并按YII格式配置默认站点
# /home/work/_app/nginx/html目录下，必须要有一个web目录
# -----------------------------------------------------------------------------
ADD _app/nginx/conf/conf.d/default.conf /home/work/_app/nginx/conf/conf.d/default.conf
