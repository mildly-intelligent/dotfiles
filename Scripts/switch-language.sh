#!/bin/bash

fcitx5-remote -t

if [ "$(fcitx5-remote -n)" = "keyboard (us)" ]; then
	export LANG=en_US.UTF-8
elif [ "$(fcitx5-remote -n)" = "pinyin" ]; then
	export LANG=zh_CH.UTF-8
fi
