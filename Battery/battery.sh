#!/bin/bash

while true; do
	if [ "Discharging" == "$(cat /sys/class/power_supply/BAT0/status)" ]; then
		battery="$(cat /sys/class/power_supply/BAT0/capacity)"
		if ((battery <= 5)); then
			if [ "CRITICAL" == "$BATTERY_STATUS" ]; then continue; fi
			export BATTERY_STATUS="CRITICAL"
			notify-send --icon=/home/aurora/Settings/Battery/assets/5.png --urgency=critical "BATTERY CRITICAL (5%)" "Please go look for your charger."
		elif ((battery <= 10)); then
			if [ "VERY LOW" == "$BATTERY_STATUS" ]; then continue; fi
			export BATTERY_STATUS="VERY LOW"
			notify-send --icon=/home/aurora/Settings/Battery/assets/10.png --urgency=critical "BATTERY VERY LOW (10%)" "You should seek your charger soon."
		elif ((battery <= 20)); then
			if [ "LOW" == "$BATTERY_STATUS" ]; then continue; fi
			export BATTERY_STATUS="LOW"
			notify-send --icon=/home/aurora/Settings/Battery/assets/20.png --urgency=normal "BATTERY LOW (20%)" "You should seek your charger when possible."
		else
			export BATTERY_STATUS="OKAY"
		fi
	fi
done
