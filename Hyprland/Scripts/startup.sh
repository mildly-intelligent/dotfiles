#!/bin/bash

hyprpaper &
waybar &
hypridle &
mako &
systemctl --user start hyprpolkitagent
hyprctl setcursor dracula-cursor 22
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
libinput-gestures-setup autostart start
fcixt5 -d
/home/aurora/Settings/Scripts/battery-warning.sh
