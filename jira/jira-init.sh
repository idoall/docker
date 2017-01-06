#!/bin/bash


fileName="/opt/atlassian/jira/bin/bootstrap.jar"

# -----------------------------------------------------------------------------
# 判断文件是否存在
# -----------------------------------------------------------------------------
if [ ! -f "$fileName" ]
then
# -----------------------------------------------------------------------------
# 初始化 JIRA 的安装
# -----------------------------------------------------------------------------
    expect /home/work/_script/jira-install.sh \
    && cd /home/work/_src \
    && unzip jira7.2_hack.zip \
    && \cp -r /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.1.2.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.1.2.jar.bak \
    && \cp -r /home/work/_src/jira7.2/atlassian-extras-3.1.2.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib \
    && \cp -r /home/work/_src/jira7.2/mysql-connector-java-5.1.39-bin.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib \
    && service jira stop \
    && service jira start
else
# -----------------------------------------------------------------------------
# 如果 JIRA 用户和用户组不存在则创建
# -----------------------------------------------------------------------------
    user=jira  
    group=jira
    egrep "^$group" /etc/group >& /dev/null  
    if [ $? -ne 0 ]  
    then  
        groupadd $group  
    fi 
    egrep "^$user" /etc/passwd >& /dev/null  
    if [ $? -ne 0 ]  
    then  
        useradd -g $group $user  
    fi

# -----------------------------------------------------------------------------
# 停止服务，并重新启动
# -----------------------------------------------------------------------------
    cd /opt/atlassian/jira/bin/
    ./stop-jira.sh
    ./start-jira.sh
fi