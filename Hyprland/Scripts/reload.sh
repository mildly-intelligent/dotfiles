#!/bin/bash

hyprctl reload

pkill waybar
waybar --config /home/aurora/Waybar/Config.jsonc --style /home/aurora/Waybar/Style.css &

rm ~/Pictures/Wallpapers/.png 2>/dev/null
ln -s ~/Pictures/Wallpapers/*. ~/Pictures/Wallpapers/.png

pidof hyprpaper || hyprpaper &
hyprctl hyprpaper reload ,"~/Pictures/Wallpapers/.png"

libinput-gestures-setup restart

makoctl reload
