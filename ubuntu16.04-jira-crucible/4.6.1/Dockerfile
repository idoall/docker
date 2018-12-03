FROM idoall/ubuntu:16.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive

ENV CRUCIBLE_VERSION 4.6.1

# -----------------------------------------------------------------------------
# 安装 openjdk-8\
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
    && apt-fast install -y subversion git unzip zip openjdk-8-jdk

# -----------------------------------------------------------------------------
# 下载 crucible
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src \
    && axel -n 10 -o /home/work/_src/crucible.tar.gz https://product-downloads.atlassian.com/software/crucible/downloads/crucible-$CRUCIBLE_VERSION.zip



# -----------------------------------------------------------------------------
# 安装 crucible
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
    && unzip crucible.tar.gz \
    && mkdir -p /home/work/_app/_jira_crucible \
    && mv /home/work/_src/fecru-$CRUCIBLE_VERSION/* /home/work/_app/_jira_crucible/ \
    && mkdir -p /home/work/_data/_jira_crucible \
    && echo "FISHEYE_INST=/home/work/_data/_jira_crucible" >> /etc/environment \
    && cp /home/work/_app/_jira_crucible/config.xml /home/work/_data/_jira_crucible/


# -----------------------------------------------------------------------------
# 安装 mysql 驱动 
# -----------------------------------------------------------------------------
RUN curl -Ls https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz | tar -xz --directory /home/work/_src/ --strip-components=1 --no-same-owner \
    && cp -r /home/work/_src/mysql-connector-java-5.1.47-bin.jar /home/work/_app/_jira_crucible/lib/


COPY files/ /


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
    && chown -R work:work /home/work/* \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/apt-fast/* \
    && rm -rf /home/work/_src/*

    
# -----------------------------------------------------------------------------
# 设置环境变量
# -----------------------------------------------------------------------------
ENV FISHEYE_INST /home/work/_data/_jira_crucible

# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 8059 8060

