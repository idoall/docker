#!/bin/bash


# -----------------------------------------------------------------------------
# 初始化数据库
# -----------------------------------------------------------------------------
echo 'Initializing database'
/home/work/_app/mysql/bin/mysql_install_db --user=mysql --basedir=/home/work/_app/mysql/ --datadir=/home/work/_app/mysql/data/
echo 'Database initialized'
# -----------------------------------------------------------------------------
# 安装 mysql57
# -----------------------------------------------------------------------------
cd /home/work/_app/mysql/ \
&& cp -a ./support-files/my-default.cnf /etc/my.cnf \
&& sed -i "s/# basedir = ...../basedir = \/home\/work\/_app\/mysql/" /etc/my.cnf \
&& sed -i "s/# datadir = ...../datadir = \/home\/work\/_app\/mysql\/data/" /etc/my.cnf \
&& sed -i "s/# port = ...../port = 3306/" /etc/my.cnf \
&& sed -i "s/# socket = ...../socket = \/tmp\/mysql.sock\r\ncharacter-set-server = utf8mb4/" /etc/my.cnf \
&& echo "skip-grant-tables" >> /etc/my.cnf \
&& cp -a ./support-files/mysql.server /etc/init.d/mysqld \
&& service mysqld start \
&& ln -sf /home/work/_app/mysql/bin/mysqladmin /usr/bin \
&& ln -sf /home/work/_app/mysql/bin/mysql /usr/bin \
&& ln -sf /home/work/_app/mysql/bin/mysqldump /usr/bin \
&& ln -sf /home/work/_app/mysql/bin/mysqlbinlog /usr/bin \
&& ln -sf /home/work/_app/mysql/bin/mysqlshow /usr/bin \
&& mysql -uroot -e "flush privileges;grant all privileges on *.* to 'root'@'%' identified by '123456';grant all privileges on *.* to 'root'@'localhost' identified by '123456';flush privileges;" \
&& sed -i "s/skip-grant-tables//" /etc/my.cnf \
&& service mysqld restart

# -----------------------------------------------------------------------------
# 设置root密码
# -----------------------------------------------------------------------------
if [ ! -z "$MYSQL_ROOT_PASSWORD" ]; then
    mysql -uroot -p123456 -e "flush privileges;grant all privileges on *.* to 'root'@'%' identified by '${MYSQL_ROOT_PASSWORD}';grant all privileges on *.* to 'root'@'localhost' identified by '${MYSQL_ROOT_PASSWORD}';flush privileges;"
    echo "GENERATED ROOT PASSWORD: $MYSQL_ROOT_PASSWORD"
fi
