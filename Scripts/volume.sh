#!/bin/bash

function volume {
	pactl -f json get-sink-volume @DEFAULT_SINK@ | jq -rM '.volume."front-right".value_percent'
}

eww="eww -c $SETTINGS_DIR/Eww/ "

state=$($SCRIPTS/state.sh get CHANGING_VOLUME)

if [[ "$state" == "active" ]]; then
	pactl set-sink-volume @DEFAULT_SINK@ $1
elif [[ "$state" == "inactive" ]]; then
	pactl set-sink-volume @DEFAULT_SINK@ $1

	timeLeft=1500

	$SCRIPTS/state.sh set CHANGING_VOLUME
	$eww reload
	# $eww reload

	volumeOld=$(volume)
	while true; do
		{
			time {
				volumeNew=$(volume)
				if ((timeLeft < 0)); then
					$SCRIPTS/state.sh unset CHANGING_VOLUME
					$eww reload
					exit
				fi
				if [[ $volumeNew != $volumeOld ]]; then
					timeLeft=1500
				else
					timeLeft=$((timeLeft - 20))
				fi
				volumeOld=$volumeNew
			}
		} 2>&1
		echo $timeLeft
		sleep 0.020
	done
else
	exit 1
fi
