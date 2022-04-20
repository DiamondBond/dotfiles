#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Export Lang & Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# X11
export XDG_SESSION_TYPE=X11
export GDK_BACKEND=x11
xset b off # Disables bell
xset -dpms # Disables Energy Star features
xset s off # Disables screen saver
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources # Xresources

# Session
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets)
export SSH_AUTH_SOCK

# Display
xrandr --output eDP-1 --set "scaling mode" "Full"
xinput | grep 'ELAN224A' | grep 'pointer' | grep -Po 'id=\d+' | cut -d= -f2 | xargs xinput disable
picom -b --experimental-backends --config ~/.config/picom.conf
hsetroot -solid "#898989"

# Launch dwm with DBus
#exec dbus-launch --sh-syntax --exit-with-session /usr/local/bin/dwm

# Launch dwm
exec dwm
