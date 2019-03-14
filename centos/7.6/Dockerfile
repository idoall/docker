FROM centos:7.6.1810
MAINTAINER lion <lion.net@163.com>

COPY files/ /


# -----------------------------------------------------------------------------
# Ensure UTF-8
# -----------------------------------------------------------------------------
ENV LANG       en_US.UTF-8


# -----------------------------------------------------------------------------
# 解决出现 Package 'dialog' has no installation candidate 的提示
# -----------------------------------------------------------------------------
ARG DEBIAN_FRONTEND=noninteractive

# -----------------------------------------------------------------------------
# 将系统时间改为上海时间
# -----------------------------------------------------------------------------
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    \
# -----------------------------------------------------------------------------
# 创建work用户
# -----------------------------------------------------------------------------
    && useradd -r -m work \
    && echo "work:123456" | chpasswd \
    && echo "root:123456" | chpasswd 

# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
RUN yum clean all \
    && yum makecache \
    && yum install -y wget python-setuptools iputils bash-completion net-tools vim arping tar unzip


# -----------------------------------------------------------------------------
# 安装 axel 多线程下载工具
# -----------------------------------------------------------------------------
RUN rpm -Uvh /usr/src/epel-release*rpm \
    && yum install axel -y \
    && rm -rf /usr/src/epel-release*rpm


# -----------------------------------------------------------------------------
# 安装supervisor
# -----------------------------------------------------------------------------  
ENV SUPERVISOR_VERSION 3.3.3 
RUN mkdir -p /home/work/_src/ /home/work/_app/supervisord/conf.d/ /home/work/_logs/supervisord/ \
    && yum install -y supervisor \
    && echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
    && echo "" > /home/work/_logs/supervisord/supervisord.log \
    && echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/tmp\/supervisord.pid/\/var\/run\/supervisord.pid/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/var\/run\/supervisor\/supervisor.sock/\/var\/run\/supervisor.sock/" /etc/supervisord.conf \
    && sed -i "s/\/tmp\/supervisor.sock/\/var\/run\/supervisor.sock/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/logfile=\/tmp\/supervisord.log/logfile=\/home\/work\/_logs\/supervisord\/supervisord.log/" /home/work/_app/supervisord/supervisord.ini 

# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& yum clean all \
  	&& rm -rf /home/work/_src/*

# -----------------------------------------------------------------------------
# Define working directory.
# -----------------------------------------------------------------------------
WORKDIR /home/work

ENTRYPOINT ["/bin/bash", "-e", "/init/entrypoint"]
CMD ["run"]