#!/bin/bash

check_results=`expressvpn status`
time=$(date "+%Y-%m-%d %H:%M:%S")
if [[ $check_results =~ "Unable to connect" ]]
then
    echo "[$time]Unable to connect.. "
    expressvpn connect
elif [[ -z $check_results ]]
then
    echo "[$time]空.. "
    expressvpn connect
elif [[ $check_results =~ "Reconnecting" ]]
then
    echo "[$time]Reconnecting.. "
elif [[ $check_results =~ "Not connected" ]]
then
    echo "[$time]Not connected.. "
    expressvpn connect
elif [[ $check_results =~ "Not Activated" ]]
then
    echo "[$time]Not Activated.. "
    /usr/bin/expect /tmp/expressvpnActivate.sh
else
	connectStr=`echo $check_results | sed -n '1p'`
	echo "[$time]$connectStr"
fi