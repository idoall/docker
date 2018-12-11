FROM ubuntu:18.04
MAINTAINER lion <lion.net@163.com>

ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /



# -----------------------------------------------------------------------------
# 安装 apt-fast && axel
# -----------------------------------------------------------------------------
RUN apt-get update -y \
	&& apt-get -y upgrade \
	&& apt-get -o Dpkg::Options::=--force-confdef -y install software-properties-common \
	&& add-apt-repository ppa:apt-fast/stable \
	&& apt-get update -y \
	&& apt-get -y install apt-fast axel

# -----------------------------------------------------------------------------
# 基础工具
# -----------------------------------------------------------------------------
RUN apt-fast -o Dpkg::Options::=--force-confdef -y install curl netcat wget telnet vim bzip2 ssmtp locales python-pip  bash-completion net-tools iputils-ping \
	&& locale-gen en_US.utf8 \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
	&& chmod -R 777 /var/run /var/log /etc/passwd /etc/group \
	&& pip --no-cache install --upgrade pip


# -----------------------------------------------------------------------------
# 设置时区
# -----------------------------------------------------------------------------
RUN apt-fast install -y tzdata \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata


# -----------------------------------------------------------------------------
# 创建work用户
# -----------------------------------------------------------------------------
RUN useradd -r -m work \
    && echo "work:123456" | chpasswd \
    && echo "root:123456" | chpasswd


# -----------------------------------------------------------------------------
# 安装 supervisor
# -----------------------------------------------------------------------------
RUN apt-fast install -y supervisor \
	&& mkdir -p /home/work/_app/supervisord/conf.d/ /home/work/_logs/supervisord/ \
	&& echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
	&& echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/tmp\/supervisord.pid/\/var\/run\/supervisord.pid/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/logfile=\/tmp\/supervisord.log/logfile=\/home\/work\/_logs\/supervisord\/supervisord.log/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/etc\/supervisor\/supervisord.conf/\/home\/work\/_app\/supervisord\/supervisord.ini/" /etc/init.d/supervisor


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
# Define working directory.
# -----------------------------------------------------------------------------
WORKDIR /home/work


# -----------------------------------------------------------------------------
# Ensure UTF-8
# -----------------------------------------------------------------------------
ENV \
	LC_ALL=en_US.UTF-8 \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8

ENTRYPOINT ["/bin/bash", "-e", "/init/entrypoint"]
CMD ["run"]

