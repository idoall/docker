FROM idoall/ubuntu16.04-tengine2.2.0-php:7.1.9
MAINTAINER lion <lion.net@163.com>

ENV ZENTAO_VERSION 10.5.1

RUN mkdir -p /home/work/_app/php7.1.9/session \
	&& chmod o=rwx -R /home/work/_app/php7.1.9/session

RUN wget -O /home/work/_src/zenTaoPMS.zip http://dl.cnezsoft.com/zentao/10.5.1/ZenTaoPMS.$ZENTAO_VERSION.zip \
	&& cd /home/work/_src \
	&& unzip zenTaoPMS.zip \
	&& mv zentaopms/* /home/work/_app/nginx/html


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /var/cache/apt/archives/apt-fast/* \
  	&& rm -rf /home/work/_src/*