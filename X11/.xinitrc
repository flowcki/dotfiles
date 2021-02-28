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


# Gestion des mots de passe pour les rendre disponibles dans des applications (jetbrains)
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

setxkbmap fr &
udiskie -t & # automount
dunst & # notification
nm-applet & # NetworkManager
blueman-applet & # Bluetooth

# Création du répertoire pour stocker les screenshots
mkdir -p ~/Pictures/screenshots

# Curseur
xsetroot -cursor_name left_ptr

# Corrige le bug pour ne pas que les GUI JVM soient vides
export _JAVA_AWT_WM_NONREPARENTING=1
wmname LG3D

picom -b --no-fading-openclose --experimental-backends

if [ -x $HOME/.screenlayout/external-monitors.sh ];then
	$HOME/.screenlayout/external-monitors.sh
fi

exec bspwm