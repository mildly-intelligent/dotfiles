#!/bin/bash

while true; do
	if [ "Discharging" == "$(cat /sys/class/power_supply/BAT0/status)" ]; then
		battery="$(cat /sys/class/power_supply/BAT0/capacity)"
		if ((battery <= 5)); then
			if [ "CRITICAL" == "$BATTERY_STATUS" ]; then continue; fi
			export BATTERY_STATUS="CRITICAL"
			notify-send --icon=/home/mildly-intelligent/Settings/Assets/bat5.png --urgency=critical "BATTERY CRITICAL (5%)" "Plug in your computer."
		elif ((battery <= 10)); then
			if [ "VERY LOW" == "$BATTERY_STATUS" ]; then continue; fi
			export BATTERY_STATUS="VERY LOW"
			notify-send --icon=/home/mildly-intelligent/Settings/Assets/bat10.png --urgency=critical "BATTERY VERY LOW (10%)" "Please plug in your computer."
		elif ((battery <= 20)); then
			if [ "LOW" == "$BATTERY_STATUS" ]; then continue; fi
			export BATTERY_STATUS="LOW"
			notify-send --icon=/home/mildly-intelligent/Settings/Assets/bat20.png --urgency=normal "BATTERY LOW (20%)" "Plug in your computer when possible."
		else
			export BATTERY_STATUS="OKAY"
		fi
	fi
done
