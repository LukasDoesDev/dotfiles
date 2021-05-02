#!/bin/sh

# If file exists and execute permission is granted
if [ -x "$HOME/.screenlayout.sh" ]; then
    ~/.screenlayout.sh
fi


# SSH funky stuff
SSH_ASKPASS=/usr/bin/ssh-add
eval `ssh-agent -s`



WALLPAPER="$HOME/wallpapers/clean arch.png"
# WALLPAPER="$HOME/wallpapers/windows_jk_archlinux.jpg"

picom & 
dunst &

if [ -r "$WALLPAPER" ]; then
    feh --bg-scale "$WALLPAPER" &
fi

setxkbmap 'fi'
flameshot &

~/.dwm/statusLoop.sh &

xrdb ~/.Xresources

exec dwm
