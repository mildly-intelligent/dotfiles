#!/bin/bash

hyprpaper &
waybar --config /home/mildly-intelligent/Waybar/Config.jsonc --style /home/mildly-intelligent/Waybar/Style.css &
hypridle &
mako --config /home/mildly-intelligent/Misc/Mako &
systemctl --user start hyprpolkitagent
hyprctl setcursor dracula-cursor 22
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
libinput-gestures-setup autostart start
fcixt5 -d
/home/mildly-intelligent/Settings/Scripts/battery-warning.sh
