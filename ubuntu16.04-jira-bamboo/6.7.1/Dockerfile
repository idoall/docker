FROM idoall/ubuntu:16.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive

ENV BAMBOO_VERSION 6.7.1

# -----------------------------------------------------------------------------
# 安装 openjdk-8\
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
    && apt-fast install -y subversion git unzip zip openjdk-8-jdk

# -----------------------------------------------------------------------------
# 下载 bamboo
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_src \
    && axel -n 10 -o /home/work/_src/bamboo.tar.gz https://product-downloads.atlassian.com/software/bamboo/downloads/atlassian-bamboo-$BAMBOO_VERSION.tar.gz


# -----------------------------------------------------------------------------
# 安装 bamboo
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
    && tar -xzvf bamboo.tar.gz \
    && mkdir -p /home/work/_app/_jira_bamboo \
    && mv /home/work/_src/atlassian-bamboo-$BAMBOO_VERSION/* /home/work/_app/_jira_bamboo/ \
    && mkdir -p /home/work/_data/_jira_bamboo \
    && sed -i "s/\#bamboo.home=C:\/bamboo\/bamboo-home/bamboo.home=\/home\/work\/_data\/_jira_bamboo/" /home/work/_app/_jira_bamboo/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties

# -----------------------------------------------------------------------------
# 安装 bamboo mysql 驱动 
# -----------------------------------------------------------------------------
RUN curl -Ls https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz | tar -xz --directory /home/work/_src/ --strip-components=1 --no-same-owner \
    && cp -r /home/work/_src/mysql-connector-java-5.1.47-bin.jar /home/work/_app/_jira_bamboo/atlassian-bamboo/WEB-INF/lib/


COPY files/ /

# -----------------------------------------------------------------------------
# 破解 bamboo
# -----------------------------------------------------------------------------
RUN mv /home/work/_app/_jira_bamboo/atlassian-bamboo/WEB-INF/lib/atlassian-extras-decoder-v2-3.3.0.jar /home/work/_app/_jira_bamboo/atlassian-bamboo/WEB-INF/lib/atlassian-extras-decoder-v2-3.3.0.jar.bak \
    && mv /home/work/_app/_jira_bamboo/atlassian-bamboo/WEB-INF/lib/atlassian-extras-legacy-3.3.0.jar /home/work/_app/_jira_bamboo/atlassian-bamboo/WEB-INF/lib/atlassian-extras-legacy-3.3.0.jar.bak \
    && cp -r /usr/src/_bamboo/* /home/work/_app/_jira_bamboo/atlassian-bamboo/WEB-INF/lib/

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
EXPOSE 8085 54663

