#!/bin/bash

case "$1" in
    *.jpg|*.jpeg|*.png|*.gif|*.webp|*.svg|*.bmp|*.tiff|*.tif)
        imv -zq "$1"
        ;;
esac
