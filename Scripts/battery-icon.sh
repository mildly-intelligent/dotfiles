#!/bin/bash

bat=$(cat /sys/class/power_supply/BAT0/capacity)
if (($(date +%N) >= 400000000)); then
	if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]; then
		echo 󰂄
		exit
	fi
fi
if ((bat >= 90)); then
	echo 󰁹
elif ((bat >= 80)); then
	echo 󰂂
elif ((bat >= 70)); then
	echo 󰂁
elif ((bat >= 60)); then
	echo 󰂀
elif ((bat >= 50)); then
	echo 󰁿
elif ((bat >= 40)); then
	echo 󰁾
elif ((bat >= 30)); then
	echo 󰁽
elif ((bat >= 20)); then
	echo 󰁼
elif ((bat >= 10)); then
	echo 󰁻
elif ((bat >= 5)); then
	echo 󰁺
elif ((bat >= 0)); then
	echo 󰂃
fi
