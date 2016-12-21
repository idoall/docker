#!/bin/bash


# -----------------------------------------------------------------------------
# 初始化数据库
# -----------------------------------------------------------------------------
php /home/work/_site/walle-web-1.2.0/config/createdb.php
cd /home/work/_site/walle-web-1.2.0 \
&& echo yes | ./yii walle/setup