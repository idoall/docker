FROM centos:6.8
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
# 安装 axel 多线程下载工具
# -----------------------------------------------------------------------------
RUN cp /usr/src/_axel/axelget.conf /etc/yum/pluginconf.d/ \
    && cp /usr/src/_axel/axelget.py /usr/lib/yum-plugins/ \
    && rpm -ivh usr/src/_axel/axel-2.4-1.el6.rf.x86_64.rpm


# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
RUN yum clean all \
    && yum makecache \
    && yum install -y wget python-setuptools iputils bash-completion net-tools vim arping tar unzip


# -----------------------------------------------------------------------------
# 安装supervisor
# -----------------------------------------------------------------------------  
ENV SUPERVISOR_VERSION 3.3.3 
RUN mkdir -p /home/work/_src/ /home/work/_app/supervisord/conf.d/ /home/work/_logs/supervisord/ \
	&& wget -O /home/work/_src/supervisor.tgz https://pypi.python.org/packages/31/7e/788fc6566211e77c395ea272058eb71299c65cc5e55b6214d479c6c2ec9a/supervisor-$SUPERVISOR_VERSION.tar.gz \
	&& tar xzvf /home/work/_src/supervisor.tgz -C /home/work/_src/ \
	&& cd /home/work/_src/supervisor-$SUPERVISOR_VERSION \
    && python setup.py install \
    && echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
    && echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/tmp\/supervisord.pid/\/var\/run\/supervisord.pid/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/logfile=\/tmp\/supervisord.log/logfile=\/home\/work\/_logs\/supervisord\/supervisord.log/" /home/work/_app/supervisord/supervisord.ini 


# -----------------------------------------------------------------------------
# 将 supervisor 将入启动项
# -----------------------------------------------------------------------------  
RUN chmod +x /etc/init.d/supervisord \
    && chkconfig --add supervisord \
    && chkconfig supervisord on


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

