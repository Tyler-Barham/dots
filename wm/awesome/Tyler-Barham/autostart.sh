#!/usr/bin/env bash


function runonce {
  if ! pgrep $1 ; then
    $@&
  fi
}

if xrandr | grep -q 'DP-1-2 connected' ; then
    xrandr --output DP-1-2 --primary
    xrandr --output DP-1-1 --right-of DP-1-2 --rotate right
    xrandr --output eDP-1 --off
fi

nitrogen --restore

runonce "picom"

