FROM idoall/supervisor
MAINTAINER lion <lion.net@163.com>



# -----------------------------------------------------------------------------
# 安装 expect 工具
# -----------------------------------------------------------------------------
RUN yum makecache \
    && yum install -y tcl expect \
    \
# -----------------------------------------------------------------------------
# 安装java8环境
# -----------------------------------------------------------------------------
    && cd /home/work/_src \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz \
    && mkdir -p /usr/lib/jvm \
    && tar zxvf jdk-8u111-linux-x64.tar.gz -C /usr/lib/jvm \
    \
# -----------------------------------------------------------------------------
#   配置root用户的环境变量
# -----------------------------------------------------------------------------
    && echo "export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_111" >>  ~/.bashrc \        
    && echo "export JRE_HOME=\$JAVA_HOME/jre" >>  ~/.bashrc \
    && echo "export CLASSPATH=.:\$JAVA_HOME/lib:\$JRE_HOME/lib" >>  ~/.bashrc \
    && echo "PATH=\$JAVA_HOME/bin:\$PATH" >>  ~/.bashrc \
    \
# -----------------------------------------------------------------------------
#   配置ssh登录后的环境变量
# -----------------------------------------------------------------------------
    && echo "export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_111" >>  /etc/profile \
    && echo "export JRE_HOME=\$JAVA_HOME/jre" >>  /etc/profile \
    && echo "export CLASSPATH=.:\$JAVA_HOME/lib:\$JRE_HOME/lib" >>  /etc/profile \
    && echo "PATH=\$JAVA_HOME/bin:\$PATH" >>  /etc/profile \
    \
    && rm -rf /home/work/_src/jdk-8u111-linux-x64.tar.gz


# -----------------------------------------------------------------------------
# 加入破解文件
# -----------------------------------------------------------------------------
ADD jira7.2_hack.zip /home/work/_src


# -----------------------------------------------------------------------------
# 下载jira
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
#    && wget https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.2.7-x64.bin \
#    && chmod 755 atlassian-jira-software-7.2.7-x64.bin \
    && wget https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.2.4-x64.bin \
    && chmod 755 atlassian-jira-software-7.2.4-x64.bin \
    \
# -----------------------------------------------------------------------------
# 删除多余文件
# -----------------------------------------------------------------------------
    && yum clean all

# -----------------------------------------------------------------------------
# 复制启动命令
# -----------------------------------------------------------------------------
COPY jira-install.sh /home/work/_script/jira-install.sh
COPY jira-init.sh /home/work/_script/jira-init.sh
RUN chmod 777 /home/work/_script/jira-init.sh

# -----------------------------------------------------------------------------
# 通过 supervisor 启动 jira
# -----------------------------------------------------------------------------
ADD _app/supervisord/conf.d/jira.ini /home/work/_app/supervisord/conf.d/jira.ini


# Define data volumes
VOLUME ["/opt/atlassian", "/var/atlassian"]


# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 8080 8085 8443 8090
