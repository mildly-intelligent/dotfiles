#!/bin/bash

filepath="$HOME/Pictures/Screenshots/$(date +%Y%m%d-%H%M%S).png"

region=$(wayfreeze --after-freeze-cmd "slurp -dw 2 -b cdd6f475 -c 00000000; pkill wayfreeze")
if [[ "$region" != "" ]]; then
	if grim -cg "$region" "$filepath"; then
		wl-copy --type image/png <"$filepath" &&
		hyprctl notify 5 3000 "rgb(89b4fa)" "Screenshot taken!"
	else
		hyprctl notify 0 3000 "rgb(f38ba8)" "Screenshot failed!"
	fi
else
	hyprctl notify 1 3000 "rgb(74c7ec)" "Screenshot canceled!"
fi