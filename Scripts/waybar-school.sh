#!/bin/bash

SCHEDULE="/home/aurora/Settings/Misc/school2025-26schedule.jsonc"

daily=$(jq -crM ".\"weekly\".$(date +%w) $SCHEDULE")
echo weekly

if [ "$daily" = "null" ]; then
	echo "No School Today!"
	exit
fi