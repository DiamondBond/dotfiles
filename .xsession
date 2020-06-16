#!/bin/bash
# X11
#xrandr --output DisplayPort-1 --mode 1920x1080 --rate 143.98
xrdb "/home/diamond/.Xresources"
hsetroot -solid "#9b9b9b"
xset b off &
#xset m 0 0
#xset -b
#ulimit -c unlimited

xbindkeys &
dunst &
#polkit &
nm-applet &
mate-volume-control-applet &
xfce4-power-manager &
#thunar --daemon &
#light-locker &
#compton --vsync opengl -CGb &
#tint2 &

while true; do
    xsetroot -name "$(/home/diamond/bin/cputemp) | $(/home/diamond/bin/battery) | $(date +%F) $(date +%I:%M)"
    sleep 5
done &

#xrdb ~/.Xresources

#while true; do
#    /usr/local/bin/dwm 2> /dev/null
#done

#exec dbus-launch i3
#exec dbus-launch openbox-session
#exec dbus-launch sowm

# The below export will make Qt5 applications use the GTK font style
#export XDG_CURRENT_DESKTOP=xfce

# Set classic root window cursor
#xsetroot -cursor_name X_cursor

# Backgrounds
#xsetroot -solid teal
#xsetroot -solid gray
#xsetroot -solid gray30
#xsetroot -solid gray40
#xsetroot -solid gray50
#xsetroot -solid '#444444'
#xsetroot -solid cadetblue
#xsetroot -solid steelblue
#xsetroot -solid cadetblue

# Clock + Meter: Steel Blue
#exec xclock -digital -strftime "   %I:%M" -face "Liberation Mono:size=13" -bg steelblue -fg '#004070' -geometry 119x30-0+0 -padding 5 &
#exec xload -bg steelblue -fg '#001013' -nolabel -geometry 119x120-0+30 &

#exec dbus-launch twm
#exec dbus-launch openbox-session
exec dbus-launch dwm
