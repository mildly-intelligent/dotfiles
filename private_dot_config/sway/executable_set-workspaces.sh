#!/bin/bash

echo "" > $HOME/.config/sway/workspaces.sway

old_IFS="$IFS"
IFS=';'

i=1
while read line; do
    if [[ "$line" == "" ]] || [[ "$line" == \#* ]]; then
        continue
    fi

    line=($line)
    name=$(echo "${line[0]}" | xargs)
    command=$(echo "${line[1]}" | xargs)
    
    echo "set \$ws$i \"$name\"" >> $HOME/.config/sway/workspaces.sway
    echo "set \$da$i \"$command\"" >> $HOME/.config/sway/workspaces.sway
    echo "" >> $HOME/.config/sway/workspaces.sway
    
    i=$(( $i + 1 ))
done < $HOME/.config/sway/workspaces

IFS="$old_IFS"