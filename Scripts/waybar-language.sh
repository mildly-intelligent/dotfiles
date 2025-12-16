#!/bin/bash

lang="$(fcitx5-remote -n)"

if [[ "$lang" = "pinyin" ]]; then
	echo "中文 (拼)"
elif [ "$lang" = "keyboard-us" ]; then
	echo "ENG (us)"
fi
