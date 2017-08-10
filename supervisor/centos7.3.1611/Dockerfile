FROM centos:7.3.1611
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
ADD axel-2.4-1.el6.rf.x86_64.rpm /home/work/_src/
ADD axelget.conf /etc/yum/pluginconf.d/
ADD axelget.py /usr/lib/yum-plugins/
RUN cd /home/work/_src \
    && rpm -ivh axel-2.4-1.el6.rf.x86_64.rpm


# -----------------------------------------------------------------------------
# 更改源为国内源
# -----------------------------------------------------------------------------
RUN yum install wget -y \
    && cd /etc/yum.repos.d/ \
    && mv CentOS-Base.repo CentOS-Base.repo.bak \
    && wget -O CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
    && wget http://mirrors.163.com/.help/CentOS7-Base-163.repo \
    && yum clean all \
    && yum makecache \
    \
# -----------------------------------------------------------------------------
#   更新系统
# -----------------------------------------------------------------------------   
    && yum -y update \
    \
# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
    && yum install -y wget python-setuptools iputils bash-completion \
    && yum install -y net-tools vim arping \
    && yum install -y zlib zlib-devel openssl openssl--devel openssh-clients pcre pcre-devel libtool \
    && yum install -y tar unzip man cmake patch lsof \
    && yum install -y cyrus-sasl-plain cyrus-sasl cyrus-sasl-devel cyrus-sasl-lib \
    && yum install -y autoconf file gcc gcc-c++ make pkg-config re2c pkg-config


# -----------------------------------------------------------------------------
# 安装 supervisor
# -----------------------------------------------------------------------------   
ADD supervisor-3.3.0.tar.gz /home/work/_src
ADD supervisord.service /usr/lib/systemd/system/
RUN cd /home/work/_src/supervisor-3.3.0 \
    && python setup.py install \
    && mkdir -p /home/work/_app/supervisord/ /home/work/_logs/supervisord/ \
    && echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
    && echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/logfile=\/tmp\/supervisord.log/logfile=\/home\/work\/_logs\/supervisord\/supervisord.log/" /home/work/_app/supervisord/supervisord.ini \
    \
# -----------------------------------------------------------------------------
#   将 supervisor 将入启动项
# -----------------------------------------------------------------------------  
    && systemctl enable supervisord

# -----------------------------------------------------------------------------
# 安装 meld3-1.0.2/
# -----------------------------------------------------------------------------  
ADD meld3-1.0.2.tar.gz /home/work/_src
RUN cd /home/work/_src/meld3-1.0.2 \
    && python setup.py install


# -----------------------------------------------------------------------------
# 安装sshd
# -----------------------------------------------------------------------------   
RUN yum install -y openssh-server openssh-client \
    && sed -i 's/#RSAAuthentication yes/RSAAuthentication yes/g' /etc/ssh/sshd_config \
    && sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config \
    && sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g' /etc/ssh/sshd_config \
    && ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' \
    && ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
    && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N '' \
    && ssh-keygen -q -t rsa -P '' -f /root/.ssh/id_rsa \
    && cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

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
# Define working directory.
# -----------------------------------------------------------------------------
WORKDIR /home/work



# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 22

# -----------------------------------------------------------------------------
# 添加执行文件
# -----------------------------------------------------------------------------
ADD run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]
