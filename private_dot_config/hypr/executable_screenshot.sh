#!/bin/bash

filepath="$GRIM_DEFAULT_DIR$(date +%Y%m%d_%Hh%Mm%Ss_grim.png)"

grim -g "$(slurp -d)" $filepath
cat $filepath | wl-copy --type image/png