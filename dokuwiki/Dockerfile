FROM idoall/nginx-php
MAINTAINER lion <lion.net@163.com>

ADD dokuwiki-release_stable_2016-06-26a.tar.gz /home/work/_app/nginx/

# -----------------------------------------------------------------------------
# 复制启动命令
# -----------------------------------------------------------------------------
COPY dokuwiki-init.sh /home/work/_script/dokuwiki-init.sh
RUN chmod 777 /home/work/_script/dokuwiki-init.sh

# -----------------------------------------------------------------------------
# 通过 supervisor 启动 dokuwiki
# -----------------------------------------------------------------------------
ADD _app/supervisord/conf.d/dokuwiki.ini /home/work/_app/supervisord/conf.d/dokuwiki.ini