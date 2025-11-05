#!/bin/bash

event=$1
warningNo=$2

oldIFS=$IFS
IFS=$'\n'

details=($(jq -crM '.name,.description,.starttime,.startdate,.endtime,.enddate,.repeat,.location,.warning,.notify' $event))
warning=($(jq -crM '.warning[]' $event))

IFS=$oldIFS
unset $oldIFS

function get_item {
	[[ $1 != "null" ]] && echo $@ || echo ""
}

name=${details[0]}
description=$(get_item ${details[1]})
starttime=$(get_item ${details[2]})
startdate=$(get_item ${details[3]})
endtime=$(get_item ${details[4]})
enddate=$(get_item ${details[5]})
location=$(get_item ${details[7]})
timeleft=${warning[$warningNo]}

timeleftHuman=""
if (( (timeleft / 60) >= 1 )); then
	timeleftHuman+=" $(( $timeleft / 60 )) hour"
	if (( (timeleft / 60) != 1 )); then
		timeleftHuman+="s"
	fi
fi
if (( (timeleft % 60) >= 1 )); then
	timeleftHuman+=" $(( $timeleft % 60 )) minute"
	if (( (timeleft % 60) != 1 )); then
		timeleftHuman+="s"
	fi
else
	timeleftHuman+=" zero minutes"
fi
timeleftHuman=${timeleftHuman:1}

notification=("$name" "In $timeleftHuman minutes at $location\n$description")
# echo -e $notification
notify-send "$name" "In $timeleftHuman at $location\n$description"