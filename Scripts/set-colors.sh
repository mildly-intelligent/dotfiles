#!/bin/bash

echo "/* === Color Pallette === */" | tee /home/aurora/Settings/Waybar/Colors.css /home/aurora/Settings/Eww/Colors.scss 2>/dev/null
echo "/* --- Colors --- */" | tee -a /home/aurora/Settings/Waybar/Colors.css /home/aurora/Settings/Eww/Colors.scss 2>/dev/null

for color in $(env | grep -e ^COLOR_[[:alnum:]]\*=.\*); do
	name=$(echo $color | awk -F'=' '{ print tolower(substr($1, 7)) }')
	hex=$(echo $color | awk -F'=' '{ print $2 }')

	# CSS
	echo "@define-color $name #$hex;" >> /home/aurora/Settings/Waybar/Colors.css
	# SCSS
	echo "\$$name: #$hex;" >> /home/aurora/Settings/Eww/Colors.scss
done

echo -e "\n/* --- Aliases --- */" | tee -a /home/aurora/Settings/Waybar/Colors.css /home/aurora/Settings/Eww/Colors.scss 2>/dev/null


for color in $(env | grep -e ^COLOR_ALIAS_[[:alnum:]]\*); do
	alias=$(echo $color | awk -F'=' '{ print tolower(substr($1, 13)) }')
	name=$(echo $color | awk -F'=' '{ print $2 }')
	hex="${!name}"
	
	# CSS
	echo "@define-color $alias #$hex;" >> /home/aurora/Settings/Waybar/Colors.css
	# SCSS
	echo "\$$alias: #$hex;" >> /home/aurora/Settings/Eww/Colors.scss
done