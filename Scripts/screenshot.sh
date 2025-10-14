#!/bin/bash

filepath="$HOME/Pictures/Screenshots/$(date +%Y%m%d-%H%M%S).png"

grim -cg "$(slurp -dw 2 -b cdd6f475 -c 00000000)" "$filepath" &&
	wl-copy --type image/png <"$filepath" &&
	notify-send Screenshot "Screenshot taken!"
