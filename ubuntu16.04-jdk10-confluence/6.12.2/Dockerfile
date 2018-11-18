FROM idoall/ubuntu16.04-jdk:10
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive

# -----------------------------------------------------------------------------
# 安装 expect 工具
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
    && apt-fast install -y tcl expect unzip zip

# -----------------------------------------------------------------------------
# 下载confluence
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src \
    && axel -n 10 -o /home/work/_src/confluence.bin https://product-downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-6.12.2-x64.bin


COPY files/ /

# -----------------------------------------------------------------------------
# 安装confluence
# -----------------------------------------------------------------------------
RUN chmod +x /home/work/_src/confluence.bin \
    && expect /home/work/_script/confluence-install.sh \
    && cp -r /usr/src/_confluence/mysql-connector-java-5.1.47-bin.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/ \
    && service confluence stop

# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks /usr/src/_confluence/* /home/work/_script/* \
    && chown -R work:work /home/work/* \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/apt-fast/* \
    && rm -rf /home/work/_src/* \
    && rm -rf /home/work/_script/confluence-install.sh

# -----------------------------------------------------------------------------
# Define data volumes
# -----------------------------------------------------------------------------
VOLUME ["/opt/atlassian", "/var/atlassian"]

# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 8000 8090


# -----------------------------------------------------------------------------
# 设置环境变量
# -----------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/jdk10
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH $JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH