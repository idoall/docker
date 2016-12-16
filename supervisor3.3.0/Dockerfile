FROM centos:7
MAINTAINER lion <lion.net@163.com>

# -----------------------------------------------------------------------------
# Ensure UTF-8
# -----------------------------------------------------------------------------
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8


# -----------------------------------------------------------------------------
# 解决出现 Package 'dialog' has no installation candidate 的提示
# -----------------------------------------------------------------------------
ARG DEBIAN_FRONTEND=noninteractive


# -----------------------------------------------------------------------------
# 更改源为阿里云
# -----------------------------------------------------------------------------
RUN yum install -y wget iputils \
    && cd /etc/yum.repos.d/ \
    && mv CentOS-Base.repo CentOS-Base.repo.bak \
    && wget -O CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
    && wget http://mirrors.163.com/.help/CentOS7-Base-163.repo \
    && yum clean all \
    && yum makecache \
    \
# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
    && yum install -y python-setuptools \
    \
# -----------------------------------------------------------------------------
# 创建work用户
# -----------------------------------------------------------------------------
    && useradd -r -m -s /bin/bash work \
    && echo "work:123456" | chpasswd \
    && echo "root:123456" | chpasswd 


# -----------------------------------------------------------------------------
# 安装supervisor
# -----------------------------------------------------------------------------   
ADD supervisor-3.3.0.tar.gz /home/work/_src
RUN cd /home/work/_src/supervisor-3.3.0 \
    && python setup.py install \
    && mkdir -p /home/work/_app/supervisord/ \
    && echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
    && echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini

# -----------------------------------------------------------------------------
# 设置work目录的用户和用户组
# -----------------------------------------------------------------------------
RUN chown -R work:work /home/work/*


# -----------------------------------------------------------------------------
# # Define working directory.
# -----------------------------------------------------------------------------
WORKDIR /home/work


# 表示镜像运行默认参数，可被重写覆盖
CMD ["/usr/bin/supervisord", "-n", "-c", "/home/work/_app/supervisord/supervisord.ini"]
