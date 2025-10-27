#!/bin/bash

lang="$(fcitx5-remote -n)"

if [[ "$lang" = "pinyin" ]]; then
	echo 中文
else
	echo ENG
fi
