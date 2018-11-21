FROM idoall/ubuntu:16.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive


COPY files/ /

# -----------------------------------------------------------------------------
# 安装 expect 工具
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
    && apt-fast install -y tcl expect unzip zip openjdk-8-jdk

# -----------------------------------------------------------------------------
# 下载jira
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src \
    && axel -n 10 -o /home/work/_src/jira.bin https://product-downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.12.3-x64.bin

# -----------------------------------------------------------------------------
# 安装jira
# -----------------------------------------------------------------------------
RUN chmod +x /home/work/_src/jira.bin \
    && expect /home/work/_script/jira-install.sh \
    && cd /home/work/_src \
    && curl -Ls https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz | tar -xz --directory . --strip-components=1 --no-same-owner \
    && cp -r /home/work/_src/mysql-connector-java-5.1.47-bin.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib \
    && service jira stop

# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks /home/work/_script/* \
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
EXPOSE 8080 8005 8443 8090
