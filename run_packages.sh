#!/bin/bash

# Install packages:

# Important packages and drivers should be installed manually.

# DE:
sudo pacman -S --noconfirm wayland-protocols
    sudo pacman -S --noconfirm xorg-server xorg-xwayland
    sudo pacman -S --noconfirm ly
    sudo pacman -S --noconfirm wofi waybar swaybg swayimg
    sudo pacman -S --noconfirm wlroots
    sudo pacman -S --noconfirm wl-clipboard
    sudo pacman -S --noconfirm grim slurp
    sudo pacman -S --noconfirm neofetch 
yay -S --noconfirm swayfx-git

# non-important:
sudo pacman -S --noconfirm blender
    sudo pacman -S --noconfirm btop	 
    sudo pacman -S --noconfirm cmatrix
    sudo pacman -S --noconfirm cowsay
    sudo pacman -S --noconfirm fd
    sudo pacman -S --noconfirm ffmpeg
    sudo pacman -S --noconfirm firefox
    sudo pacman -S --noconfirm fish
    sudo pacman -S --noconfirm flatpak
    sudo pacman -S --noconfirm foot
    sudo pacman -S --noconfirm fwupd
    sudo pacman -S --noconfirm godot
    sudo pacman -S --noconfirm gparted
    sudo pacman -S --noconfirm jdk-openjdk
    sudo pacman -S --noconfirm nemo
    sudo pacman -S --noconfirm wine
    sudo pacman -S --noconfirm wev
    sudo pacman -S --noconfirm w3m
    sudo pacman -S --noconfirm vlc
    sudo pacman -S --noconfirm unzip
    sudo pacman -S --noconfirm ttf-hack-nerd ttf-noto-nerd terminus-font
    sudo pacman -S --noconfirm yazi
    sudo pacman -S --noconfirm steam
    sudo pacman -S --noconfirm rocm-opencl-runtime
    sudo pacman -S --noconfirm libsixel
    sudo pacman -S --noconfirm nvim
  
yay -S --noconfirm appimagelauncher
    yay -S --noconfirm visual-studio-code-bin
    yay -S --noconfirm spotify spicetify-cli
    yay -S --noconfirm vim-plug
