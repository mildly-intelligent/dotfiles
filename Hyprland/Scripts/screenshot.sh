#!/bin/bash

filepath="$HOME/Pictures/Screenshots/$(date +%Y%m%d_%Hh%Mm%Ss_grim.png)"

grim -cg "$(slurp -dw 2 -b cdd6f475 -c cba6f7e0)" "$filepath" &&
	wl-copy --type image/png <"$filepath" &&
	notify-send Screenshot "Screenshot taken!"

