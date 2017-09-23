#!/bin/bash


# 启动 supervisord
service supervisord start
# 启动 sshd
service sshd start

# outpu log
revel run github.com/idoall.org/my-app
