FROM centos:6.8
MAINTAINER lion <lion.net@163.com>

# -----------------------------------------------------------------------------
# Ensure UTF-8
# -----------------------------------------------------------------------------
ENV LANG       en_US.UTF-8


# -----------------------------------------------------------------------------
# 解决出现 Package 'dialog' has no installation candidate 的提示
# -----------------------------------------------------------------------------
ARG DEBIAN_FRONTEND=noninteractive


# -----------------------------------------------------------------------------
# 更改源为阿里云
# -----------------------------------------------------------------------------
RUN yum install -y wget \
#    && cd /etc/yum.repos.d/ \
#    && mv CentOS-Base.repo CentOS-Base.repo.bak \
#    && wget -O CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
#    && wget http://mirrors.163.com/.help/CentOS6-Base-163.repo \
    && yum clean all \
    && yum makecache

# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
RUN yum install -y wget python-setuptools iputils bash-completion \
    && yum install -y net-tools vim arping \
    && yum install -y zlib zlib-devel openssl openssl--devel openssh-clients pcre pcre-devel libtool \
    && yum install -y tar unzip man cmake patch lsof \
    && yum install -y cyrus-sasl-plain cyrus-sasl cyrus-sasl-devel cyrus-sasl-lib \
    && yum install -y autoconf file gcc gcc-c++ make pkg-config re2c pkg-config

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
# 安装supervisor
# -----------------------------------------------------------------------------   
ADD supervisor-3.3.0.tar.gz /home/work/_src
RUN cd /home/work/_src/supervisor-3.3.0 \
    && python setup.py install \
    && mkdir -p /home/work/_app/supervisord/ /home/work/_logs/supervisord/ \
    && echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
    && echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/logfile=\/tmp\/supervisord.log/logfile=\/home\/work\/_logs\/supervisord\/supervisord.log/" /home/work/_app/supervisord/supervisord.ini

# -----------------------------------------------------------------------------
# 安装sshd
# -----------------------------------------------------------------------------   
RUN yum install -y openssh-server openssh-client \
    && sed -i 's/#RSAAuthentication yes/RSAAuthentication yes/g' /etc/ssh/sshd_config \
    && sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config \
    && sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g' /etc/ssh/sshd_config \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
    && ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

# -----------------------------------------------------------------------------
# 删除多余文件
# -----------------------------------------------------------------------------
RUN mkdir -p /home/work/_script/ \
    && yum clean all \
    && rm -rf /home/work/_src/* 

# -----------------------------------------------------------------------------
# 设置work目录的用户和用户组
# -----------------------------------------------------------------------------
RUN chown -R work:work /home/work/*

# -----------------------------------------------------------------------------
# 使用 supervisor 启动sshd的配置文件
# -----------------------------------------------------------------------------
ADD _app /home/work/_app


# -----------------------------------------------------------------------------
# Define working directory.
# -----------------------------------------------------------------------------
WORKDIR /home/work

# -----------------------------------------------------------------------------
# 添加执行文件
# -----------------------------------------------------------------------------
ADD run.sh /
RUN chmod +x /run.sh

# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 22


# 表示镜像运行默认参数，可被重写覆盖
CMD ["/run.sh"]
