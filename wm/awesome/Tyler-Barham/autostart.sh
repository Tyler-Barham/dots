#!/usr/bin/env bash


function runonce {
    if ! pgrep $1 ; then
        "$@" &
    fi
}

function set_monitor_layout {
    if xrandr | grep -q 'DP-1-2 connected' ; then
        xrandr --output DP-1-2 --primary
        xrandr --output DP-1-1 --right-of DP-1-2 --rotate right
        xrandr --output eDP-1 --off
    else
        xrandr --output eDP-1 --primary
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

set_monitor_layout
set_compositor
set_wallpaper
set_screen_timeout
set_network
set_bluetooth

