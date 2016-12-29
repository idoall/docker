FROM idoall/nginx-php
MAINTAINER lion <lion.net@163.com>

ADD dokuwiki-release_stable_2016-06-26a.tar.gz /home/work/_app/nginx/

RUN rm -rf /home/work/_app/nginx/html/* \
    && chown work:work -R /home/work \
    && mv /home/work/_app/nginx/dokuwiki-release_stable_2016-06-26a/* /home/work/_app/nginx/html/ \
    && rm -rf /home/work/_app/nginx/dokuwiki-release_stable_2016-06-26a/
