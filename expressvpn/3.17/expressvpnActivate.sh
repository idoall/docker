#!/usr/bin/expect
spawn expressvpn activate
expect "code:"
send "$env(ACTIVATION_CODE)\r"
expect "information."
send "n\r"
expect eof