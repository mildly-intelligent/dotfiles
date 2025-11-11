#!/bin/bash

function volume {
	amixer -D pulse sget Master | awk -F"[][]" '/Left:/ { sub(/%/,""); print $2 }'
}

volumeOld=$(volume)

eww="eww -c $SETTINGS_DIR/Eww/ "
$eww active-windows | grep -q volume-slider || $eww open volume-slider

state=$($SCRIPTS/state.sh get CHANGING_VOLUME)

if [[ "$state" == "active" ]]; then
	amixer -qD pulse sset Master $1
elif [[ "$state" == "inactive" ]]; then
	amixer -qD pulse sset Master $1
	
	timeLeft=2000

	$SCRIPTS/state.sh set CHANGING_VOLUME
	$eww reload
	while true; do
		volumeNew=$(volume)
		if (( timeLeft >= 0 )); then
			:
		else
			$SCRIPTS/state.sh unset CHANGING_VOLUME
			$eww reload
			exit
		fi
		if [[ $volumeNew != $volumeOld ]]; then
			timeLeft=2000
		else
			timeLeft=$((timeLeft - 20))
		fi
		volumeOld=$volumeNew
		sleep 0.020
	done
else
	exit 1
fi