FROM idoall/ubuntu:16.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive

ENV CROWD_VERSION 3.3.2

# -----------------------------------------------------------------------------
# 安装 openjdk-8\
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
    && apt-fast install -y unzip zip openjdk-8-jdk

# -----------------------------------------------------------------------------
# 下载 crowd
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src \
    && axel -n 10 -o /home/work/_src/crowd.tar.gz https://product-downloads.atlassian.com/software/crowd/downloads/atlassian-crowd-$CROWD_VERSION.tar.gz

# -----------------------------------------------------------------------------
# 安装 crowd
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
    && tar -xzvf crowd.tar.gz \
    && mkdir -p /home/work/_app/_jira_crowd \
    && mv /home/work/_src/atlassian-crowd-$CROWD_VERSION/* /home/work/_app/_jira_crowd/ \
    && mkdir -p /home/work/_data/_jira_crowd \
    && echo "crowd.home=/home/work/_data/_jira_crowd" >> /home/work/_app/_jira_crowd/crowd-webapp/WEB-INF/classes/crowd-init.properties

# -----------------------------------------------------------------------------
# 安装 mysql 驱动 
# -----------------------------------------------------------------------------
RUN curl -Ls https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz | tar -xz --directory /home/work/_src/ --strip-components=1 --no-same-owner \
    && cp -r /home/work/_src/mysql-connector-java-5.1.47-bin.jar /home/work/_app/_jira_crowd/crowd-webapp/WEB-INF/lib/


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
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 8095

