FROM alpine:3.9.3
MAINTAINER lion <lion@.888@gmail.com>
# -----------------------------------------------------------------------------
# 将系统时间改为上海时间
# -----------------------------------------------------------------------------
RUN apk add tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
# -----------------------------------------------------------------------------
# 添加 ca 证书认证
# -----------------------------------------------------------------------------
RUN apk add ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*
