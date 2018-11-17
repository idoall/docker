FROM idoall/ubuntu:16.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive

# -----------------------------------------------------------------------------
# 安装java10环境
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src/ \
    && axel -n 10 -o /home/work/_src/jdk.tar.gz https://cdn.azul.com/zulu/bin/zulu10.1+11-jdk10-linux_x64.tar.gz \
    && cd /home/work/_src \
    && mkdir -p /usr/lib/jvm/jdk10 \
    && tar zxvf jdk.tar.gz \
    && mv zulu10.1+11-jdk10-linux_x64/* /usr/lib/jvm/jdk10

# -----------------------------------------------------------------------------
# 设置环境变量
# -----------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/jdk10
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH $JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH