FROM idoall/golang:1.12.4
MAINTAINER lion <lion.888@gmail.com>

# Install golint
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

COPY files /