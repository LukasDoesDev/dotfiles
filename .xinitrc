#!/bin/sh

# If file exists and execute permission is granted
if [ -x "$HOME/.screenlayout.sh" ]; then
    ~/.screenlayout.sh
fi


# SSH funky stuff
#SSH_ASKPASS=/usr/bin/ssh-add
#eval $(keychain --eval --quiet)
#eval `ssh-agent -s`

eval $(gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK
#SSH_ASKPASS='/usr/lib/seahorse/ssh-askpass'
#SSH_ASKPASS='/usr/bin/ssh-add'

#WALLPAPER="$HOME/wallpapers/stuff.jpg"
WALLPAPER="$HOME/wallpapers/rainbow.png"
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

#exec dwm
exec i3
#exec spectrwm
