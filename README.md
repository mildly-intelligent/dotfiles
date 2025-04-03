# General Info:


I decided to start tracking my dotfiles on github after I learned about chezmoi from a youtube video.
I mostly did this so I can port my config files to my laptop but if anyone likes my config files feel free to take them.


# Apps:


## Core System:

### Distro & Kernel:
For my distro, I went with Arch because memes. Also, after using it for a while, I did enjoy its package manager and the general customizability of it.
(I mostly use it as opposed to something else for the memes tho.)
I use linux-lts because for some reason that's what grub defaults to. I've tried changing it but it kept using LTS. I'm pretty sure I even uninstalled it so I have zombie Linux. ![zombie linux](https://www.gamingonlinux.com/uploads/articles/tagline_images/1657036839id962gol.jpg).

### Display Server:
Wayland because that's what KDE was using and I didn't feel like switching DS's when moving to SwayWM.

### Login/Display Manager:
I'm using ly because GDM comes with all of GNOME and SDDM was a wee bit broken (froze everytime I tried to log in). Using the shell and just running `sway` didn't work either because my keyboard would constantly send the null character `^@` until I unplugged it and plugged it back in. Because of that it couldn't properly read my password so it was hella janky to log in. Also ly's great.

### Init System:
Systemd? I didn't even know there were alternatives before I started writing this README.


## Desktop

### DE/WM:
No Desktop Enviornment, I used to use KDE Plasma but switched to sway because a youtube video convinced me to try Tiling Window Managers and I really liked it.
For my Window Manager, I use SwayFX (a fork of Sway), I've heard good things about Hyprland too but I've also seen a lot of people saying that it isn't fully developed yet so I'll hold off trying it for now.

### Status Bar:
I use waybar.
I'm using a custom fork of someone's dotfiles, I thought I wrote down the github repo for their dotfiles but I guess not.
I'm pretty sure [this](https://github.com/harsh-m-patil/.dotfiles) is it but I'm not sure.

### Launcher:
Mostly I use a custom system where each workspace has a default application and an alt application called with Meta+Alt+Space and Meta+Alt+Shift+Space respectively.
If I need to launch an app that isn't there, I'll use rofi.

### Notification Daemon:
Not entirely sure what a daemon is (or if I spelled it right), but the notification manager I use is SwayNC because it works fine and I really jsut wanted a notification manager at all.


## Terminal:

### Emulator:
I use foot because it works great, easily configurable, and none of the other's I've tried really accomplished what I wanted.

### Shell:
For my terminal I use fish. In the TTY I use bash because fish doesn't look great in a TTY.
For shell scripting I also use bash because 1) it's more common and there's more help online for it, and 2) I already got used to the language before i switched to fish.

### Powerline:
I use oh-my-posh. I got halfway through making a custom powerline theme but it's ***sooo*** annoying so I gave up and might start again later. Currently I use the blue-owl theme I think.


## Editor and Developement:

### Primary Editor:
VSCode, I started off with notepad++ in 5th grade where I was first introduced to programming (and where I fell in love with it). After a while, I picked up Python and used the IDLE shell for a while until I tried learning Java. For Java developement, I used Intellij Idea Community Edition which also had Python support. I think my friend showed me VSCode for the first time and I loved it enough that I've used it ever since.

### Terminal Text Editor:
So I was getting tired of Nano's goofiness so I was looking for alternatives and in that search, tried learning NeoVim (what is the correct capitalization btw?) mostly for the memes.
I ended up liking it enough that I fully switched from nano.
I'm using the lualine and catppuccin (my beloved) packages.

## File Management:


### Primary File Manager:
I was getting a bit frustrated with nemo (now my fallback file manager) because of how I had to use my mouse a lot as opposed to a lot of the rest of my system so I went looking for a terminal file manager.
In my journey I found NNN (the configuration was way too wierd), Ranger (I couldn't get it to do what I wanted), SuperFile (I'm still keeping my eye on that one for when it gets further along in developement because it was almost perfect), and finally, Yazi.
For Yazi, I have a catppuccin (I can't get enough of this theme, seriously it's unhealthy) theme and yamb for bookmarks. I've fully customized the keybindings (it was so painful) and it's almost perfect (perfection for me would be somewhere in between Yazi and SuperFile).

### GUI File Manger:
For things that require a GUI, I use nemo (cinnamon's file manger).


## Appearance:

### Color Theme:
Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin Catppuccin. It's a healthy obsession I swear.
Also I use the Mocha flavor because I live in perpetual darkness.

### Icon Theme:
Papirus, it's simply incredible the work that was put into this icon theme. They have an icon for the most obscure shit like Kerbal Space Program. Not only do they have icons for anything you can think of, they all look great too.

### Cursor:
Dracula, I honsetly don't pay much attention to the cursor so IDC.

### Fonts:
#### Terminal:
Hack, great font, no notes.
Also the Hack Nerd Font because nerd fonts are awesome.
#### Main:
Noto sans, I'm a basic bitch. Also it looks fine.


## Applications:

### Browser:
Firefox, I tried Brave but the search engine's layout was so alien that I immediatley switched back.

### Messeging:
BetterDiscord with the catppuccin theme.

### Media Player:
VLC for files and Spicetify for music.

### Mail:
Thunderbird

### Office:
LibreOffice

### Game Dev:
I don't do much game dev but when I do (I should do that again, I haven't in a really long time) I use Godot.

### 3D Art:
Blender

### System Info Fetcher:
btop, using it makes me feel like how I pictured Linux users felt before I started using Linux.


## Dotfile Manager:
Chezmoi, to see installation instructions, look [here](#Installation)



# Installation:

1. Install chezmoi and yay:
```bash
sudo pacman -S chezmoi  # Install Chezmoi.
chezmoi init            # Set up chezmoi for use.
# This code is copied from the readme for yay:
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

2. Clone this repository into the chezmoi directory:
```bash
git clone https://github.com/mildly-intelligent/dotfiles.git ~/.local/share/chezmoi/
chezmoi apply   # Apply these changes to your user directory.
```

3. That should be it.
