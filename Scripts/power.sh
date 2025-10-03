#!/bin/bash

case $1 in
'-?' | '--help')
	cat <<EOF
Usage:
	power [flag]
Flags:
	-?	--help		Prints this message.
	-p	--power		Shuts down the computer.
	-r	--reboot	Reboots the computer.
	-s	--sleep		Suspends the computer's state to RAM.
	-h	--hibernate	Suspends the computer's state to swap space.
	-l	--logout	Exits Hyprland.
	-k	--lock		Opens the lock screen.
EOF
	;;
'-p' | '--power')
	echo Shutting down!
	shutdown now
	;;
'-r' | '--reboot')
	echo Rebooting!
	systemctl reboot
	;;
'-s' | '--sleep')
	echo Going to sleep!
	systemctl suspend
	;;
'-h' | '--hibernate')
	echo Hibernating!
	echo TODO
	;;
'-l' | '--logout')
	echo Logging out!
	~/Settings/Hyprland/Scripts/exit.sh
	hyprctl dispatch exit
	;;
'-k' | '--lock')
	echo Locking!
	hyprlock
	;;
*)
	echo Unknown option "$1"
	;;
esac
