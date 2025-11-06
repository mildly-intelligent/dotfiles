#!/bin/bash

hyprctl -q notify 1 3000 "rgb(f9e2af)" "Reloading"

pkill waybar
waybar --config /home/aurora/Settings/Waybar/Config.jsonc --style /home/aurora/Settings/Waybar/Style.css &
sleep 1
echo $(ps -U aurora | grep $!)

if [[ "$(ps -U aurora | grep $!)" != "" ]]; then
	hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Waybar reloaded"
else
	hyprctl -q notify 3 3000 "rgb(a6e3a1)" "Waybar failed to load"
fi

rm ~/Pictures/Wallpapers/.png 2>/dev/null
ln -s ~/Pictures/Wallpapers/*. ~/Pictures/Wallpapers/.png

libinput-gestures-setup restart
hyprctl -q notify 5 3000 "rgb(a6e3a1)" "libinput-gestures reloaded"

makoctl reload
hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Mako reloaded"

swww img ~/Settings/Wallpapers/$(hyprctl -q activeworkspace -j | jq .id) -t wave
hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Swww reloaded"


hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Fully reloaded"

