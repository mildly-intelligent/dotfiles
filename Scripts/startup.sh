#!/bin/bash

crond &
swww-daemon &
waybar --config $SETTINGS_DIR/Waybar/config.jsonc --style $SETTINGS_DIR/Waybar/style.css &
hypridle &
mako --config $SETTINGS_DIR/Misc/Mako &
systemctl --user start hyprpolkitagent
hyprctl setcursor dracula-cursor 22
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve-standard+default"
libinput-gestures-setup autostart start
fcixt5 -d &
nm-applet &
eww -c $SETTINGS_DIR/Eww/ daemon &
eww -c $SETTINGS_DIR/Eww/ open volume-slider &
$SCRIPTS/battery-warning.sh &

# === Export some environment variables for ease of use in places that don't have access to them ===
# To add something to the env file, add the line
# 	env | grep -e ^= >> $envFile
# With the variable name between `^` and `=`
envFile="$SETTINGS_DIR/Misc/env"
echo "# Saved enviornment variables for use in root scoped scripts, to use do \`source $SETTINGS_DIR/Misc/env\`" > $envFile
echo "export $(env | grep -e ^DISPLAY=)" >> $envFile
echo "export $(env | grep -e ^HYPRLAND_INSTANCE_SIGNATURE=)" >> $envFile
echo "export $(env | grep -e ^DBUS_SESSION_BUS_ADDRESS=)" >> $envFile

