#!/bin/bash



# 启动 supervisord
service supervisord start
# 启动 sshd
service sshd start
# 启动 nginx
/home/work/_app/nginx/sbin/nginx
# 启动 php-fpm
service php-fpm start

# outpu log
tail -F /home/work/_logs/supervisord/supervisord.log \
		/home/work/_logs/nginx/default.access.log \
		/home/work/_logs/nginx/default.error.log \
		/home/work/_logs/nginx/error.log \
		/home/work/_logs/php/fpm-php.slow.log \
		/home/work/_logs/php/php-fpm.error.log
