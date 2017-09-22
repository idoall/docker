#!/bin/bash


# -----------------------------------------------------------------------------
# 设置HOST
# -----------------------------------------------------------------------------
if [ ! -z "$MYSQL_HOST" ]; then
    sed -i "s/IDOALL_HOST/$MYSQL_HOST/" /home/work/_site/walle-web-1.2.0/config/local.php
else
    sed -i "s/IDOALL_HOST/mysql/" /home/work/_site/walle-web-1.2.0/config/local.php
fi
# -----------------------------------------------------------------------------
# 设置数据库名称
# -----------------------------------------------------------------------------
if [ ! -z "$MYSQL_DB" ]; then
    sed -i "s/IDOALL_DB/$MYSQL_DB/" /home/work/_site/walle-web-1.2.0/config/local.php
else
    sed -i "s/IDOALL_DB/walle-web/" /home/work/_site/walle-web-1.2.0/config/local.php
fi
# -----------------------------------------------------------------------------
# 设置数据库用户名
# -----------------------------------------------------------------------------
if [ ! -z "$MYSQL_USERNAME" ]; then
    sed -i "s/IDOALL_USERNAME/$MYSQL_USERNAME/" /home/work/_site/walle-web-1.2.0/config/local.php
else
    sed -i "s/IDOALL_USERNAME/root/" /home/work/_site/walle-web-1.2.0/config/local.php
fi
# -----------------------------------------------------------------------------
# 设置root密码
# -----------------------------------------------------------------------------
if [ ! -z "$MYSQL_PASSWORD" ]; then
    sed -i "s/IDOALL_PASSWORD/$MYSQL_PASSWORD/" /home/work/_site/walle-web-1.2.0/config/local.php
else
    sed -i "s/IDOALL_PASSWORD/123456/" /home/work/_site/walle-web-1.2.0/config/local.php
fi

# -----------------------------------------------------------------------------
# 初始化数据库
# -----------------------------------------------------------------------------
cd /home/work/_site/walle-web-1.2.0 \
&& echo yes | ./yii walle/setup