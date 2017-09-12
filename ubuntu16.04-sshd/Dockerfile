FROM idoall/ubuntu:16.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /


# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN apt-fast update -y \
	&& apt-fast -o Dpkg::Options::="--force-confold" install -y openssh-server unzip \
	&& mkdir --mode 700 /var/run/sshd \
    && ssh-keygen -q -t rsa -P '' -f /root/.ssh/id_rsa \
    && cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
	&& apt-get -y clean \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& rm -rf /var/cache/apt/archives/apt-fast/* \
  	&& rm -rf /home/work/_src/*


# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 2222