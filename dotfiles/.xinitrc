#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

# change root mouse pointer to an arrow (instead of an X)
#xsetroot -cursor_name left_ptr

# Turn on Numlock
#numlockx &

# Start Dropbox in the background
#LANG=en_US.UTF-8 dropboxd &

# Start XMonad
#exec ck-launch-session xmonad
exec ck-launch-session gnome-session
