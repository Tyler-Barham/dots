#!/usr/bin/env bash


function runonce {
  if ! pgrep $1 ; then
    $@&
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

    # Lock after inactivity
    runonce xautolock -time 30 -locker "dm-tool lock" -notify 30 -notifier "notify-send -u critical -t 15000 -- 'Autolocking screen...'"
}

function set_compositor {
    runonce picom
}

function set_wallpaper {
    nitrogen --restore
}

set_monitor_layout
set_compositor
set_wallpaper
set_screen_timeout

