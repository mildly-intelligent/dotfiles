#!/bin/bash

crond &
swww-daemon &
waybar --config /home/aurora/Settings/Waybar/Config.jsonc --style /home/aurora/Settings/Waybar/Style.css &
hypridle &
mako --config /home/aurora/Misc/Mako &
systemctl --user start hyprpolkitagent
hyprctl setcursor dracula-cursor 22
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
libinput-gestures-setup autostart start
fcixt5 -d &
nm-applet &
/home/aurora/Settings/Scripts/battery-warning.sh &
/home/aurora/Settings/Scripts/hyprland-event-watcher.sh &

# === Export some environment variables for ease of use in places that don't have access to them ===
# To add something to the env file, add the line
# 	env | grep -e ^= >> $envFile
# With the variable name between `^` and `=`
envFile="/home/aurora/Settings/Misc/env"
echo "# Saved enviornment variables for use in root scoped scripts, to use do \`source /home/aurora/Settings/Misc/env\`" > $envFile
echo "export $(env | grep -e ^DISPLAY=)" >> $envFile
echo "export $(env | grep -e ^HYPRLAND_INSTANCE_SIGNATURE=)" >> $envFile
echo "export $(env | grep -e ^DBUS_SESSION_BUS_ADDRESS=)" >> $envFile



export NO_AT_BRIDGE=1
eval $(dbus-launch --sh-syntax)
export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID
export DBUS_SESSION_BUS_WINDOWID
