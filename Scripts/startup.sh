#!/bin/bash

hyprpaper &
waybar --config /home/aurora/Settings/Waybar/Config.jsonc --style /home/aurora/Settings/Waybar/Style.css &
hypridle &
mako --config /home/aurora/Misc/Mako &
systemctl --user start hyprpolkitagent
hyprctl setcursor dracula-cursor 22
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
libinput-gestures-setup autostart start
fcixt5 -d &
nm-applet &
/home/aurora/Settings/Scripts/battery-warning.sh
