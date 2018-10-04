#!/bin/bash
key="$1"
case $key in
    laptoponly)
        xrandr --output eDP-1 --auto --primary
        xrandr --output DP-2-1 --off
        xrandr --output DP-2-2 --off
        ;;
    2screen)
        xrandr --output DP-2-2 --auto --primary
        xrandr --output DP-2-1 --auto --right-of DP-2-2
        xrandr --output eDP-1 --off
        sleep 1
        i3-msg 'workspace number 2; move workspace to output DP-2-1'
        i3-msg 'workspace number 3; move workspace to output DP-2-1'
        i3-msg 'workspace number 1; move workspace to output DP-2-2'
        ;;
    all)
        xrandr --output DP-2-2 --auto --primary
        xrandr --output DP-2-1 --auto --right-of DP-2-2
        xrandr --output eDP-1 --auto --right-of DP-2-1
        i3-msg 'workspace number 3, move to output eDP-1'
        i3-msg 'workspace number 2, move to output DP-2-2'
        i3-msg 'workspace number 1, move to output DP-2-1'

        ;;
esac

