#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# If file exists and execute permission is granted
if [ -x "$HOME/.screenlayout.sh" ]; then
    ~/.screenlayout.sh
fi


# SSH funky stuff
#SSH_ASKPASS=/usr/bin/ssh-add
#eval $(keychain --eval --quiet)
#eval `ssh-agent -s`

#eval $(gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK
#SSH_ASKPASS='/usr/lib/seahorse/ssh-askpass'
#SSH_ASKPASS='/usr/bin/ssh-add'

#WALLPAPER="$HOME/wallpapers/stuff.jpg"
#WALLPAPER="$HOME/wallpapers/rainbow-shadow.png"
WALLPAPER="$HOME/wallpapers/clean arch.png"
# WALLPAPER="$HOME/wallpapers/windows_jk_archlinux.jpg"

picom --experimental-backends & 
dunst &
numlockx &

#notify-send 'Hello, World!'

if [ -r "$WALLPAPER" ]; then
    feh --bg-scale "$WALLPAPER" &
fi

setxkbmap 'fi' &
flameshot &

#~/.dwm/statusLoop.sh &

xrdb ~/.Xresources

#exec dwm
#exec i3
#exec spectrwm
#exec awesome

session=${1:-i3}

case $session in

  i3 | i3wm)
    exec i3 ${@:2}
    ;;

  openbox)
    exec openbox-session ${@:2}
    ;;

  leftwm)
    exec dbus-launch leftwm ${@:3}
    ;;

  *)
    exec $session ${@:2}
    ;;
esac

