#!/usr/bin/expect

#一直等待程序的输入
set timeout -1

#设置变量
set will_install Enter
set express_install 1

# 启动安装程序
spawn /home/work/_src/atlassian-jira-software-7.2.2-x64.bin

expect {
    "OK*" { send "$will_install\r"; exp_continue}
    "Express Install (use default settings) [1]*" { send "$express_install\r" }
}

#之后将ssh控制权转交给用户
interact