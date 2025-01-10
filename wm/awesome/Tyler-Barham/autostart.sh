#!/usr/bin/env bash

srcDir=$(dirname $(realpath ${BASH_SOURCE[0]}))

function runonce {
    if ! pgrep $1 ; then
        "$@" &
    fi
}

function set_screen_timeout {
    # Screen blank for powersaving
    xset s off
    xset s noblank
    xset -dpms
}

function set_compositor {
    runonce picom
}

function set_wallpaper {
    nitrogen --restore
}

function set_network {
    runonce nm-applet
}

function set_bluetooth {
    runonce blueman-applet
}

# Call xrandr via `display-setup-script` in /etc/lightdm/lightdm.conf
# so that the displays are setup before any rendering
# ${srcDir}/xrandr.sh

set_compositor
set_wallpaper
set_screen_timeout
set_network
set_bluetooth

