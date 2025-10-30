#!/bin/bash

lang="$(fcitx5-remote -n)"

if [ "$lang" = "keyboard-us" ]; then
	notify-send "Input method changed!" "Keyboard is now set to Pinyin input method."
	fcitx5-remote -s "pinyin"
elif [ "$lang" = "pinyin" ]; then
	notify-send "Input method changed!" "Keyboard is now set to Wubi input method."
	fcitx5-remote -s "wbx"
elif [ "$lang" = "wbx" ]; then
	notify-send "Input method chnaged!" "Keyboard is now set to English (US) input method."
	fcitx5-remote -s "keyboard-us"
fi
