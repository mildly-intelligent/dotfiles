#!/bin/bash

hyprctl notify 1 3000 "rgb(f9e2af)" "Reloading"

pkill waybar
waybar --config /home/aurora/Settings/Waybar/Config.jsonc --style /home/aurora/Settings/Waybar/Style.css &
hyprctl notify 5 3000 "rgb(a6e3a1)" "Waybar reloaded"

rm ~/Pictures/Wallpapers/.png 2>/dev/null
ln -s ~/Pictures/Wallpapers/*. ~/Pictures/Wallpapers/.png

libinput-gestures-setup restart
hyprctl notify 5 3000 "rgb(a6e3a1)" "libinput-gestures reloaded"

makoctl reload
hyprctl notify 5 3000 "rgb(a6e3a1)" "Mako reloaded"

swww img ~/Settings/Wallpapers/$(hyprctl activeworkspace -j | jq .id) -t wave
hyprctl notify 5 3000 "rgb(a6e3a1)" "Swww reloaded"


hyprctl notify 5 3000 "rgb(a6e3a1)" "Fully reloaded"

