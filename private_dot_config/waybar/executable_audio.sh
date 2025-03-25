#!/bin/bash

percent=$(pactl get-sink-volume @DEFAULT_SINK@ | grep '%' | awk '{print $5}' | sed 's/%//g')

declare -a symbols=(
    [0]=" "
    [1]=""
    [2]=""
    [3]=" "
    [4]=" "
)

if (($percent == 0)); then
    # Muted:
    echo Muted ${symbols[0]}
elif ((percent > 0)) && ((percent < 50)); then
    # Low Volume:
    echo $percent% ${symbols[1]}
elif ((percent >= 50)) && ((percent < 90)); then
    # Medium Volume:
    echo $percent% ${symbols[2]}
elif ((percent >= 90)) && ((percent < 150)); then
    # High Volume:
    echo $percent% ${symbols[3]}
elif ((percent == 150)); then
    echo Maximum ${symbols[4]}
fi