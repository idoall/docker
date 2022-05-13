
# Run expressvpn in a container

FROM debian:bullseye-slim

LABEL maintainer="lion.888@gmail.com"

ENV ACTIVATION_CODE Code
ENV LOCATION smart
ENV PREFERRED_PROTOCOL auto
ENV LIGHTWAY_CIPHER auto

ARG APP=expressvpn_3.23.1.0-1_amd64.deb

# -----------------------------------------------------------------------------
# 将系统时间改为上海时间
# -----------------------------------------------------------------------------
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    \
# -----------------------------------------------------------------------------
# 安装常用工具
# -----------------------------------------------------------------------------
    && apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates wget expect iproute2 curl procps libnm0 cron vim bash-completion rsyslog \
    \
# -----------------------------------------------------------------------------
# 修改root用户的shell为bash，默认使用的是ash。
# -----------------------------------------------------------------------------
    && usermod -s /bin/bash root \
    \
# -----------------------------------------------------------------------------
# 设置常用别名
# -----------------------------------------------------------------------------
    && echo "export LS_OPTIONS='--color=auto'" >> /root/.bashrc \
    && echo "alias ls='ls \$LS_OPTIONS'" >>  /root/.bashrc \
    && echo "alias ll='ls \$LS_OPTIONS -l'" >>  /root/.bashrc \
    && echo "alias l='ls \$LS_OPTIONS -lA'" >>  /root/.bashrc \
    # && source /root/.bashrc \
    \
# -----------------------------------------------------------------------------
# 创建work用户
# -----------------------------------------------------------------------------
    && useradd -r -m work \
    && echo "work:123456" | chpasswd \
    && echo "root:123456" | chpasswd 

# -----------------------------------------------------------------------------
# 安装 supervisor
# -----------------------------------------------------------------------------
RUN apt-get install -y supervisor \
	&& mkdir -p /home/work/_app/supervisord/conf.d/ /home/work/_logs/supervisord/ \
	&& echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
	&& echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/tmp\/supervisord.pid/\/var\/run\/supervisord.pid/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/logfile=\/tmp\/supervisord.log/logfile=\/home\/work\/_logs\/supervisord\/supervisord.log/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/etc\/supervisor\/supervisord.conf/\/home\/work\/_app\/supervisord\/supervisord.ini/" /etc/init.d/supervisor

# -----------------------------------------------------------------------------
# 安装ExpressVPN
# -----------------------------------------------------------------------------
RUN wget -q "https://www.expressvpn.works/clients/linux/${APP}" -O /tmp/${APP} \
    && dpkg -i /tmp/${APP} \
    && rm -rf /tmp/*.deb \
    && apt-get purge -y --auto-remove wget \
    && mkdir -p /home/work/crontab

COPY entrypoint.sh /tmp/entrypoint.sh
COPY expressvpnActivate.sh /tmp/expressvpnActivate.sh
COPY checkExpressVPNStatus.sh /home/work/crontab/checkExpressVPNStatus.sh
COPY crontab /home/work/crontab/crontab

# -----------------------------------------------------------------------------
# 定时检测 ExpressVPN 运行状态
# -----------------------------------------------------------------------------
RUN chown -R root /home/work/crontab/crontab \
    && chmod -R 0644 /home/work/crontab/crontab

# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN rm -rf /var/lib/apt/lists/*

# -----------------------------------------------------------------------------
# 定时检测 expressVPN 运行状态
# -----------------------------------------------------------------------------
RUN chown -R root /home/work/crontab \
    && chmod -R 777 /home/work/crontab/checkExpressVPNStatus.sh

ENTRYPOINT ["/bin/bash", "/tmp/entrypoint.sh"]
