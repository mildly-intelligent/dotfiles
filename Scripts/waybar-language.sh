#!/bin/bash

lang="$(fcitx5-remote -n)"

if [[ "$lang" = "keyboard-us" ]]; then
	echo ENG
else
	echo 中文
fi
