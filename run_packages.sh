#!/bin/bash

# Install packages:

# important:
sudo pacman -S --noconfirm base-devel \
 dosfstools \
 grub efibootmgr \
 mtools \
 nano \
 networkmanager \
 openssh \
 os-prober \
 sudo \
 linux-lts linux-lts-headers \
 man \
 ca-certificates

# drivers:
sudo pacman -S --noconfirm bluez-utils \
 mesa vulkan-radeon lib32-vulkan-radeon xf86-video-amdgpu \
 pipewire-alsa pipewire-pulse

# DE:
sudo pacman -S --noconfirm wayland-protocols \
 xorg-server xorg-xwayland \
 ly \
 wofi waybar swaybg swayimg \
 wlroots \
 wl-clipboard \
 grim slurp \
 neofetch 
yay -S --noconfirm swayfx-git

# non-important:
sudo pacman -S --noconfirm appimagelauncher \
 blender \
 cmatrix \
 cowsay \
 fd \
 ffmpeg \
 firefox \
 fish \
 flatpak \
 foot \
 fwupd \
 godot \
 gparted \
 jdk-openjdk \
 nemo \
 wine \
 wev \
 w3m \
 vlc \
 unzip \
 ttf-hack-nerd ttf-noto-nerd terminus-font \
 steam \
 rocm-opencl-runtime
yay -S --noconfirm visual-studio-code-bin
