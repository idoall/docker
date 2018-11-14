FROM idoall/ubuntu16.04-tengine2.2.0-php:7.1.9
MAINTAINER lion <lion.net@163.com>

ENV DOKUWIKI_VERSION 2018-04-2a
ENV DOKUWIKI_HASH 8a269cc015a64b40e4c918699f1e1142


RUN wget -O /home/work/_src/dokuwiki.tgz https://download.dokuwiki.org/out/dokuwiki-$DOKUWIKI_HASH.tgz \
	&& cd /home/work/_src \
	&& tar xzvf dokuwiki.tgz \
	&& mv dokuwiki/* /home/work/_app/nginx/html


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /var/cache/apt/archives/apt-fast/* \
  	&& rm -rf /home/work/_src/*