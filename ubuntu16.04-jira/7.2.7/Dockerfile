FROM idoall/ubuntu:16.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /

# -----------------------------------------------------------------------------
# 安装 expect 工具
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
    && apt-fast install -y tcl expect unzip zip

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
# 下载jira
# -----------------------------------------------------------------------------
RUN axel -n 10 -o /usr/src/_jira/ https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.2.7-x64.bin


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks /usr/src/_jira/* /home/work/_script/* \
    && chown -R work:work /home/work/* \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/apt-fast/* \
    && rm -rf /home/work/_src/*


# -----------------------------------------------------------------------------
# Define data volumes
# -----------------------------------------------------------------------------
VOLUME ["/opt/atlassian", "/var/atlassian"]


# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 8080 8085 8443 8090


# -----------------------------------------------------------------------------
# 设置环境变量
# -----------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/jdk8
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH $JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH