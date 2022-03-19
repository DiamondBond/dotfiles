#!/bin/sh

# Export Lang & Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# X11
export XDG_SESSION_TYPE=X11
export GDK_BACKEND=x11

# Launch dwm via DBus
exec dbus-launch --sh-syntax --exit-with-session /usr/local/bin/dwm
