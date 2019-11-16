#!/bin/bash

# X11
xrdb "/home/diamond/.Xresources"
xset -b
ulimit -c unlimited

dunst &
#lxpolkit &
nm-applet &
mate-volume-control-applet &
xfce4-power-manager &
#thunar --daemon &
light-locker &
xbindkeys &

while true; do
    xsetroot -name "$(/home/diamond/bin/battery) | $(/home/diamond/bin/cputemp) | $(date +%F) $(date +%I:%M)"
    sleep 10
done &

hsetroot -solid "#AAAAAA"
xrdb ~/.Xresources

while true; do
    /usr/local/bin/dwm 2> /dev/null
done
