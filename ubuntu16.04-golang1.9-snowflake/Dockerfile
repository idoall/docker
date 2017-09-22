FROM idoall/ubuntu16.04-golang:1.9
MAINTAINER lion <lion.net@163.com>

COPY files/ /

RUN go install github.com/idoall/docker/snowflake/cmd/snowflake \
	&& chown -R work:work /home/work/*

ENV PORT 80

