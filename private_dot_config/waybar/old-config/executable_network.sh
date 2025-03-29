#!/bin/bash

declare -a symbols=(
    [0]=" "
    [1]="󰤯 "
    [2]="󰤟 "
    [3]="󰤢 "
    [4]="󰤥 "
    [5]="󰤨 "
    [6]="󰈀 "

)


if ip link show wlp41s0 | grep -q 'state UP'; then
    ssid=$(iwgetid -r)
    strength=$(nmcli device wifi list | grep '*' | awk {'print $8'} | grep -oE '[0-9]+')
    if (($strength >= 0)) && (($strength < 20)); then
        echo $ssid ${symbols[1]}
    elif (($strength >= 20)) && (($strength < 40)); then
        echo $ssid ${symbols[2]}
    elif (($strength >= 40)) && (($strength < 60)); then
        echo $ssid ${symbols[3]}
    elif (($strength >= 60)) && (($strength < 80)); then
        echo $ssid ${symbols[4]}
    elif (($strength >= 80)) && (($strength < 100)); then
        echo $ssid ${symbols[5]}
    fi

elif ip link show enp42s0 | grep -q 'state UP'; then
    echo Ethernet ${$symbols[6]}

else
    echo Disconnected ${$symbols[0]}

fi