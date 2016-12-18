FROM idoall/supervisor
MAINTAINER lion <lion.net@163.com>


# -----------------------------------------------------------------------------
# 通过supervisor启动
# -----------------------------------------------------------------------------
ADD _app /home/work/_app

# -----------------------------------------------------------------------------
# 安装 mysql57
# -----------------------------------------------------------------------------
RUN yum install -y libaio \
    && cd /home/work/_src \
    && wget http://dev.MySQL.com/get/Downloads/MySQL-5.7/mysql-5.7.11-Linux-glibc2.5-x86_64.tar.gz \
    && mkdir -p /home/work/_app/mysql/data \
    && tar -xvf mysql-5.7.11-Linux-glibc2.5-x86_64.tar.gz \
    && mv mysql-5.7.11-linux-glibc2.5-x86_64/* /home/work/_app/mysql/ \
    && groupadd mysql \
    && useradd -r -g mysql -s /bin/false mysql \
    && chown -R mysql:mysql /home/work/_app/mysql/ \
    \
# -----------------------------------------------------------------------------
# 删除多余文件
# -----------------------------------------------------------------------------
    && mkdir -p /home/work/_script/ \
    && rm -rf /home/work/_src/*


# -----------------------------------------------------------------------------
# 复制启动命令
# -----------------------------------------------------------------------------
COPY docker-entrypoint-mysql.sh /home/work/_script/docker-entrypoint-mysql.sh
RUN chmod 777 /home/work/_script/docker-entrypoint-mysql.sh

VOLUME /home/work/_app/mysql/data/



EXPOSE 3306