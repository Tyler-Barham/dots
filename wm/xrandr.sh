#!/usr/bin/env bash

function set_monitor_layout {
    # monitors_raw is a repeating sequence of 3 items per monitor
    # [monitor_id, max_resolution, '--', ...]
    monitors_raw=($(xrandr | grep ' connected' -A1 | awk '{print $1}'))
    monitors=()

    # Create formatted array
    # ['monitor_id max_resolution', ...]
    for (( i=0; i<${#monitors_raw[@]}; i+=3 )); do
        monitors+=("${monitors_raw[$i]} ${monitors_raw[$i+1]}")
    done

    # Echo item per line, grep to get corrent monitor, awk to get name
    dp_embedded=$( IFS=$'\n'; echo "${monitors[*]}" | grep -m1 -P '^eDP'                | awk '{print $1}')
    dp_primary=$(  IFS=$'\n'; echo "${monitors[*]}" | grep -m1 -P '^(?!eDP).*2560x1440' | awk '{print $1}')
    dp_secondary=$(IFS=$'\n'; echo "${monitors[*]}" | grep -m1 -P '^(?!eDP).*1920x1080' | awk '{print $1}')

    # If both attached
    if [ -n "$dp_primary" ] && [ -n "$dp_secondary" ]; then
        echo "Using dispay config 1"
        xrandr --output ${dp_primary} --primary --pos 0x240 --auto
        xrandr --output ${dp_secondary} --rotate right --pos 2560x0 --auto
        xrandr --output ${dp_embedded} --off

    # If only primary attached
    elif [ -n "$dp_primary" ] && [ -z "$dp_secondary" ]; then
        echo "Using dispay config 2"
        xrandr --output ${dp_primary} --primary --pos 0x0 --auto
        xrandr --output ${dp_embedded} --off

    # If only secondary attached
    elif [ -z "$dp_primary" ] && [ -n "$dp_secondary" ]; then
        echo "Using dispay config 3"
        xrandr --output ${dp_secondary} --primary --pos 0x0 --auto
        xrandr --output ${dp_embedded} --right-of ${dp_secondary} --auto

    # No external monitors
    else
        echo "Using dispay config 4"
        xrandr --output ${e_dp} --primary

    fi
}

set_monitor_layout

