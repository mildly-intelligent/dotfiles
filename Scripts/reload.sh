#!/bin/bash

# source <$SETTINGS_DIR/Misc/env

reload_hyprland() {
	hyprctl reload
	hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Hyprland config reloaded"
}

reload_colors() {
	$SCRIPTS/set-colors.sh
	hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Colors reloaded"
}

reload_waybar() {
	pkill waybar
	waybar --config $SETTINGS_DIR/Waybar/config.jsonc --style $SETTINGS_DIR/Waybar/style.css &
	sleep 1
	if [[ "$(ps -U aurora | grep $!)" != "" ]]; then
		hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Waybar reloaded"
		return
	else
		hyprctl -q notify 3 3000 "rgb(a6e3a1)" "Waybar failed to load"
		return
	fi
}

reload_eww() {
	eww kill
	eww -c $SETTINGS_DIR/Eww/ daemon
	eww -c $SETTINGS_DIR/Eww/ open volume-slider 
	hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Eww reloaded"
}

reload_wallpaper() {
	rm ~/Pictures/Wallpapers/.png 2>/dev/null
	ln -s ~/Pictures/Wallpapers/*. ~/Pictures/Wallpapers/.png
}

reload_libinput-gestures() {
	libinput-gestures-setup restart
	hyprctl -q notify 5 3000 "rgb(a6e3a1)" "libinput-gestures reloaded"
}

reload_mako() {
	makoctl reload
	hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Mako reloaded"
}

reload_swww() {
	swww clear-cache
	swww img ~/Settings/Wallpapers/$(hyprctl -q activeworkspace -j | jq .id) -t wave
	hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Swww reloaded"
}


hyprctl -q notify 1 3000 "rgb(f9e2af)" "Reloading"

reload_hyprland
reload_colors
reload_waybar &
reload_eww &
reload_wallpaper &
reload_libinput-gestures &
reload_mako &
reload_swww &

wait

hyprctl -q notify 5 3000 "rgb(a6e3a1)" "Fully reloaded"
