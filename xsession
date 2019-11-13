#!/bin/bash

dunst &
lxpolkit &
nm-applet &
mate-volume-control-applet &
xfce4-power-manager &
thunar --daemon &
light-locker &
xset b off &
xbindkeys &

while true; do
    xsetroot -name "$(/home/diamond/bin/battery) | $(date +%F) | $(date +%I:%M)"
    sleep 60
done &

hsetroot -solid "#AAAAAA"
xrdb ~/.Xresources

exec dwm
