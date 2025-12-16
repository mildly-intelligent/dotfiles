#!/bin/bash

EwwColorConfig=$SETTINGS_DIR/Eww/colors.scss
WaybarColorConfig=$SETTINGS_DIR/Waybar/colors.css
AGSColorConfig=$SETTINGS_DIR/AGS/colors.scss

ColorConfigs=(
	$EwwColorConfig
	$WaybarColorConfig
	$AGSColorConfig
)

CssColorConfigs=(
	$WaybarColorConfig
)
ScssColorConfigs=(
	$EwwColorConfig
	$AGSColorConfig
)

echo ${ColorConfigs[*]}

echo '/* This file will be overridden on reload, change $SETTINGS_DIR/Hyprland/colors.conf instead. */' | tee ${ColorConfigs[*]}
echo '/* === Color Pallette === */' | tee -a ${ColorConfigs[*]}
echo '/* --- Colors --- */' | tee -a ${ColorConfigs[*]}

for color in $(env | grep -e ^COLOR_[[:alnum:]]\*=.\*); do
	name=$(echo $color | awk -F'=' '{ print tolower(substr($1, 7)) }')
	hex=$(echo $color | awk -F'=' '{ print $2 }')

	# CSS
	echo "@define-color $name #$hex;" | tee -a ${CssColorConfigs[*]}
	# SCSS
	echo "\$$name: #$hex;" | tee -a ${ScssColorConfigs[*]}
done

echo -e '\n/* --- Aliases --- */' | tee -a ${ColorConfigs[*]}

for color in $(env | grep -e ^COLOR_ALIAS_[[:alnum:]]\*); do
	alias=$(echo $color | awk -F'=' '{ print tolower(substr($1, 13)) }')
	name=$(echo $color | awk -F'=' '{ print $2 }')
	hex="${!name}"

	# CSS
	echo "@define-color $alias #$hex;" | tee -a ${CssColorConfigs[*]}
	# SCSS
	echo "\$$alias: #$hex;" | tee -a ${ScssColorConfigs[*]}
done

