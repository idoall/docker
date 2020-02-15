FROM alpine:3.11.3
MAINTAINER lion <lion@.888@gmail.com>

COPY files/ /

# -----------------------------------------------------------------------------
# 将系统时间改为上海时间
# -----------------------------------------------------------------------------
RUN apk add tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    \
# -----------------------------------------------------------------------------
# 添加 ca 证书认证
# -----------------------------------------------------------------------------
    && apk add ca-certificates \
    && update-ca-certificates \
    \
# -----------------------------------------------------------------------------
# 修改root用户的shell为bash，默认使用的是ash。
# -----------------------------------------------------------------------------
    && apk add shadow \
    && usermod -s /bin/bash root \
    \
# -----------------------------------------------------------------------------
# 安装常用工具
# -----------------------------------------------------------------------------
    && apk add vim bash bash-completion \
    \
# -----------------------------------------------------------------------------
# 设置常用别名
# -----------------------------------------------------------------------------
    && echo "export LS_OPTIONS='--color=auto'" >> /root/.bashrc \
    && echo "alias ls='ls \$LS_OPTIONS'" >>  /root/.bashrc \
    && echo "alias ll='ls \$LS_OPTIONS -l'" >>  /root/.bashrc \
    && echo "alias l='ls \$LS_OPTIONS -lA'" >>  /root/.bashrc \
    && source /root/.bashrc \
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
RUN apk add supervisor \
    && mkdir -p /home/work/_src/ /home/work/_app/supervisord/conf.d/ /home/work/_logs/supervisord/ \
    && echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
    && echo "" > /home/work/_logs/supervisord/supervisord.log \
    && echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/tmp\/supervisord.pid/\/var\/run\/supervisord.pid/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/\/var\/run\/supervisor\/supervisor.sock/\/var\/run\/supervisor.sock/" /etc/supervisord.conf \
    && sed -i "s/\/tmp\/supervisor.sock/\/var\/run\/supervisor.sock/" /home/work/_app/supervisord/supervisord.ini \
    && sed -i "s/logfile=\/tmp\/supervisord.log/logfile=\/home\/work\/_logs\/supervisord\/supervisord.log/" /home/work/_app/supervisord/supervisord.ini 


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
	&& chown -R work:work /home/work/* \
  	&& rm -rf /home/work/_src/* /var/cache/apk/*

# -----------------------------------------------------------------------------
# Define working directory.
# -----------------------------------------------------------------------------
WORKDIR /home/work

ENTRYPOINT ["/bin/bash", "-e", "/init/entrypoint"]
CMD ["run"]