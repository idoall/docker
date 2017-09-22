FROM idoall/centos:6.8
MAINTAINER lion <lion.net@163.com>

COPY files/ /


# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN yum update -y \
    && yum install -y openssh-server \
    && mkdir --mode 700 /var/run/sshd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
    && ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
    && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key \
    && ssh-keygen -q -t rsa -P '' -f /root/.ssh/id_rsa \
    && cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
    && chown -R work:work /home/work/* \
    && yum clean all \
    && rm -rf /home/work/_src/*


# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 2222

