#!/bin/bash
export LANG="en_US.UTF-8"
export XDG_CURRENT_DESKTOP=GNOME
export XDG_MENU_PREFIX="gnome-"
export HOME="/home/obmin"
export SHELL="/bin/bash"

export DBUS_SESSION_BUS_ADDRESS=`dbus-daemon --session --print-address --fork`

#obmin-server --config /etc/obmin.json
exec "$@"
