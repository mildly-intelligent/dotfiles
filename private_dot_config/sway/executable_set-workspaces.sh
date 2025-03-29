#!/bin/bash

export_file=$HOME/.config/sway/workspaces.sway

echo "" > $export_file

old_IFS="$IFS"
IFS=';'

i=1
while read line; do
    if [[ "$line" == "" ]] || [[ "$line" == \#* ]]; then
        continue
    fi

    line=($line)
    button=$(echo "${line[0]}" | xargs)
    name=$(echo "${line[1]}" | xargs)
    command=$(echo "${line[2]}" | xargs)
    
    # bu - button:
    echo "set \$bu$i $button" >> $export_file
    # ws - workspace name:
    echo "set \$ws$i \"$name\"" >> $export_file
    # dc - default command:
    echo "set \$dc$i \"$command\"" >> $export_file

    echo "" >> $export_file

    # Bind buttons:
    echo "bindsym \$mod+\$bu$i workspace \$ws$i;    set \$dc \$dc$i" >> $export_file
    echo "bindsym \$mod+Shift+\$bu$i move container to workspace \$ws$i" >> $export_file
    
    echo "" >> $export_file; echo "" >> $export_file

    i=$(( $i + 1 ))
done < $HOME/.config/sway/workspaces

IFS="$old_IFS"
