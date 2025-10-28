#!/bin/bash

pkill waybar
waybar --config /home/aurora/Settings/Waybar/Config.jsonc --style /home/aurora/Settings/Waybar/Style.css &

rm ~/Pictures/Wallpapers/.png 2>/dev/null
ln -s ~/Pictures/Wallpapers/*. ~/Pictures/Wallpapers/.png

pidof hyprpaper || hyprpaper &
hyprctl hyprpaper reload ,"~/Pictures/Wallpapers/.png"

libinput-gestures-setup restart

makoctl reload

swww img ~/Settings/Wallpapers/$(hyprctl activeworkspace -j | jq .id) -t wave
