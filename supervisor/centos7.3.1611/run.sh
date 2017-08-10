#!/bin/bash


# 启动 supervisord
/usr/bin/supervisord -c /home/work/_app/supervisord/supervisord.ini
# 启动 sshd
/usr/sbin/sshd

# outpu log
tail -F /home/work/_logs/supervisord/supervisord.log
