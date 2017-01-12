#!/bin/bash


fileName="/home/work/_app/nginx/html/conf/dokuwiki.php"

# -----------------------------------------------------------------------------
# 判断文件是否存在
# -----------------------------------------------------------------------------
if [ ! -f "$fileName" ]
then
# -----------------------------------------------------------------------------
# 初始化 dokuwiki
# -----------------------------------------------------------------------------
    rm -rf /home/work/_app/nginx/html/* \
    && chown work:work -R /home/work \
    && mv /home/work/_app/nginx/dokuwiki-release_stable_2016-06-26a/* /home/work/_app/nginx/html/
else
    chown work:work -R /home/work
fi