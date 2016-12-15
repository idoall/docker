FROM idoall/golang
MAINTAINER lion <lion.net@163.com>


# -----------------------------------------------------------------------------
# 由于G.F.W的原因，国内只能做成包的形式
# -----------------------------------------------------------------------------
ADD golang.tar.gz /home/work

# -----------------------------------------------------------------------------
# 增加时区文件
# -----------------------------------------------------------------------------
ADD zoneinfo.tar.gz /usr/share

ADD _app /home/work/_app


# -----------------------------------------------------------------------------
# 生成revel二进制命令
# -----------------------------------------------------------------------------
RUN go install github.com/revel/cmd/revel \
    \
# -----------------------------------------------------------------------------
# 将系统时间改为上海时间
# -----------------------------------------------------------------------------
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    \
# -----------------------------------------------------------------------------
# 增加supervisor管理进程
# -----------------------------------------------------------------------------
    && apk add --no-cache supervisor \
    && mkdir -p /home/work/_app/supervisord/conf.d \
    && mkdir -p /home/work/_logs/supervisord \
    && echo_supervisord_conf > /home/work/_app/supervisord/supervisord.ini \
    && echo "[include]" >> /home/work/_app/supervisord/supervisord.ini \
    && echo "files = /home/work/_app/supervisord/conf.d/*.ini" >> /home/work/_app/supervisord/supervisord.ini \
    \
# -----------------------------------------------------------------------------
# Create a new app
# -----------------------------------------------------------------------------
    && cd /home/work/golang \
    && revel new github.com/idoall.org/my-app


# 映射端口
EXPOSE 80 9000

CMD ["/usr/bin/supervisord", "-n", "-c", "/home/work/_app/supervisord/supervisord.ini"]