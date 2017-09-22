FROM idoall/ubuntu16.04-tengine2.2.0-php:7.1.9
MAINTAINER lion <lion.net@163.com>

ENV DOKUWIKI_VERSION 2017-02-19e


RUN wget -O /home/work/_src/dokuwiki.tgz https://download.dokuwiki.org/src/dokuwiki/dokuwiki-$DOKUWIKI_VERSION.tgz \
	&& cd /home/work/_src \
	&& tar xzvf dokuwiki.tgz \
	&& mv dokuwiki-$DOKUWIKI_VERSION/* /home/work/_app/nginx/html


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /var/cache/apt/archives/apt-fast/* \
  	&& rm -rf /home/work/_src/*