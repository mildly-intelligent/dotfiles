#!/bin/bash

filepath=$(date +$HOME/Pictures/Screenshots/screenshot-%Y-%m-%d_%H:%M:%S.png)

grim -g "$(slurp -d)" $filepath
cat $filepath | wl-copy --type image/png