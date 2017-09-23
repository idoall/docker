FROM idoall/supervisor:1.9
MAINTAINER lion <lion.net@163.com>


ADD ansible-2.3.0.0-1.tar.gz /home/work/_src/ansible-2.3.0.0-1

# -----------------------------------------------------------------------------
# 安装基础环境
# -----------------------------------------------------------------------------
RUN yum clean all \
    && yum -y install epel-release \
    && yum -y install gcc libffi-devel python-devel openssl-devel gcc-c++ make PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip \
    && mkdir -p /etc/ansible/ /opt/ansible/ \
    && echo '[local]' > /etc/ansible/hosts \
    && echo 'localhost' >> /etc/ansible/hosts \
    && cd /home/work/_src/ansible-2.3.0.0-1 \
    && python setup.py install \
    \
# -----------------------------------------------------------------------------
# 删除一些多余的东西
# -----------------------------------------------------------------------------
    && rm -rf /home/work/_src/ansible* \
    && yum clean all

