#!/bin/bash

if [[ $1 == "shutdown" ]]; then
    shutdown now
elif [[ $1 == "restart" ]]; then
    reboot
elif [[ $1 == "logout" ]]; then
    swaymsg exit
elif [[ $1 == "sleep" ]]; then
    systemctl suspend
elif [[ $1 == "hibernate" ]]; then
    echo hibernate currently unavailable
else
    echo "Unknown option" > /dev/stderr
fi