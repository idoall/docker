FROM idoall/nginx-php:1.9
MAINTAINER lion <lion.net@163.com>

ADD dokuwiki-release_stable_2016-06-26a.tar.gz /home/work/_site/


# -----------------------------------------------------------------------------
# 通过 supervisor 启动 dokuwiki
# -----------------------------------------------------------------------------
ADD _app/nginx/conf/conf.d/default.conf /home/work/_app/nginx/conf/conf.d/default.conf

# -----------------------------------------------------------------------------
# 设置work目录的用户和用户组
# -----------------------------------------------------------------------------
RUN chown -R work:work /home/work/*