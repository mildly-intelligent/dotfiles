#!/bin/bash

hyprctl reload

pkill waybar; waybar &

$HOME/.config/hypr/set-workspaces.sh

pidof hyprpaper || hyprpaper &
hyprctl hyprpaper reload ,"~/Pictures/Wallpapers/.png"

pkill hypridle; hypridle &