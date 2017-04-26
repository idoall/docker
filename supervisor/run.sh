#!/bin/bash

tail -F /home/work/_logs/supervisord/supervisord.log &

# start supervisord
/usr/bin/supervisord -n -c /home/work/_app/supervisord/supervisord.ini