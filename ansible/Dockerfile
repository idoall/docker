FROM idoall/supervisor
MAINTAINER lion <lion.net@163.com>

# -----------------------------------------------------------------------------
# 安装基础环境
# -----------------------------------------------------------------------------
RUN yum clean all \
    && yum -y install epel-release \
    && yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip \
    && mkdir -p /etc/ansible/ /opt/ansible/ \
    && echo '[local]' > /etc/ansible/hosts \
    && echo 'localhost' >> /etc/ansible/hosts \
    && \
    && git clone http://github.com/ansible/ansible.git /opt/ansible/ansible \
    && cd /opt/ansible/ansible \
    && git submodule update --init


# -----------------------------------------------------------------------------
# 设置环境变量
# -----------------------------------------------------------------------------
ENV PATH /opt/ansible/ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /opt/ansible/ansible/lib
ENV ANSIBLE_LIBRARY /opt/ansible/ansible/library