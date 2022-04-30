#!/bin/bash

# Source DBus
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start IceWM with DBus
exec dbus-launch --sh-syntax --exit-with-session icewm-session
