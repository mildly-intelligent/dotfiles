#!/bin/bash

EwwColorConfig=/home/aurora/Settings/Eww/colors.scss
WaybarColorConfig=/home/aurora/Settings/Waybar/colors.css

echo "/* === Color Pallette === */" | tee $WaybarColorConfig $EwwColorConfig 2>/dev/null
echo "/* --- Colors --- */" | tee -a $WaybarColorConfig $EwwColorConfig 2>/dev/null

for color in $(env | grep -e ^COLOR_[[:alnum:]]\*=.\*); do
	name=$(echo $color | awk -F'=' '{ print tolower(substr($1, 7)) }')
	hex=$(echo $color | awk -F'=' '{ print $2 }')

	# CSS
	echo "@define-color $name #$hex;" >>$WaybarColorConfig
	# SCSS
	echo "\$$name: #$hex;" >>$EwwColorConfig
done

echo -e "\n/* --- Aliases --- */" | tee -a $WaybarColorConfig $EwwColorConfig 2>/dev/null

for color in $(env | grep -e ^COLOR_ALIAS_[[:alnum:]]\*); do
	alias=$(echo $color | awk -F'=' '{ print tolower(substr($1, 13)) }')
	name=$(echo $color | awk -F'=' '{ print $2 }')
	hex="${!name}"

	# CSS
	echo "@define-color $alias #$hex;" >>$WaybarColorConfig
	# SCSS
	echo "\$$alias: #$hex;" >>$EwwColorConfig
done

