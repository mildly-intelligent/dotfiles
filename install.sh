#!/bin/bash

cd ~
# === Package installation ===

# -- Install Paru if not already installed --
if ! paru -V; then
	sudo pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git
	cd ./paru
	makepkg -si
fi

# -- So many packages --
paru -S --needed ark bluez bluez-utils brightnessctl btop catpuccin-gtk-theme-mocha cava fastfetch fcitx5 fcitx-chinese-addons fish gnome-bluetooth grim hyprcursor-dracula-kde-git hypridle hyprland hyprlock hyprpaper hyprpolkitagent hyprsunset kitty libinput-gestures ly mako nemo nautilus noto-fonts-cjk noto-fonts-emoji oh-my-posh-bin papirus-icon-theme slurp ttf-hack-nerd wl-clipboard waybar-git wofi

# === Hardlink settings files ===
cd ~/.config/
rm -rf ./hypr/ ./waybar/ ./wofi/ ./mako/ 2>/dev/null
mkdir -p ./hypr/ ./waybar/ ./wofi/ ./mako/
cd ~/Settings/
ln -f Hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
ln -f Hyprland/hypridle.conf ~/.config/hypr/hypridle.conf
ln -f Misc/xwayland-flags ~/.config/code-flags.conf
ln -f Misc/xwayland-flags ~/.config/discord-flags.conf
ln -f Misc/xwayland-flags ~/.config/obsidian-flags.conf
ln -f Misc/xwayland-flags ~/.config/spotify-flags.conf

# === Change username ===
find ~/Settings -type f -print0 | xargs -0 sed -i '' -e "s/aurora/$USER/g"

