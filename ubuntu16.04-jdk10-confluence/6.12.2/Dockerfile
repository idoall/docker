FROM idoall/ubuntu:16.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive

# -----------------------------------------------------------------------------
# 安装java8环境
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src/ \
    && axel -n 10 -o /home/work/_src/ https://cdn.azul.com/zulu/bin/zulu8.19.0.1-jdk8.0.112-linux_x64.tar.gz \
    && cd /home/work/_src \
    && mkdir -p /usr/lib/jvm/jdk8 \
    && tar zxvf zulu8.19.0.1-jdk8.0.112-linux_x64.tar.gz \
    && mv zulu8.19.0.1-jdk8.0.112-linux_x64/* /usr/lib/jvm/jdk8

# -----------------------------------------------------------------------------
# 设置环境变量
# -----------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/jdk8
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH $JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH