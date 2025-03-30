#!/bin/bash

mkdir -p $HOME/Bookmarks
cd $HOME/Bookmarks
rm *

ln -s /                          01_root
ln -s /etc                       02_config
ln -s /dev                       03_devices
ln -s /mnt                       04_mounts

ln -s $HOME                      11_home
ln -s $HOME/.config              12_config
ln -s $HOME/.local/share/chezmoi 13_dotfiles
ln -s $HOME/Bookmarks            14_bookmarks

ln -s $HOME/3D\ Models           21_3d
ln -s $HOME/Applications         22_apps
ln -s $HOME/Documents            23_docs
ln -s $HOME/Downloads            24_downloads
ln -s $HOME/Music                25_music
ln -s $HOME/Pictures             26_pics
ln -s $HOME/Projects             27_projects
ln -s $HOME/Videos               28_vids

ln -s $HOME/Pictures             31_pics
ln -s $HOME/Pictures/Wallpapers  32_wallpapers
ln -s $HOME/Pictures/Screenshots 33_screenshots
