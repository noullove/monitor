#!/bin/bash

######################################
# /usr/local/bin/hotplug_monitor.sh
######################################

# udev runs as root, so we need to tell it how to connect to the X server:
export DISPLAY=:0
export XAUTHORITY=/run/user/1000/gdm/Xauthority

function connect()
{   
    sleep 1
    xrandr --output DP-1 --primary --output eDP-1 --off
}

function disconnect(){
    sleep 1
    xrandr --output DP-1 --off
}

if [ $(</sys/class/drm/card0-DP-1/status) == "connected" ]; then
  connect
elif [ $(</sys/class/drm/card0-DP-1/status) == "disconnected" ]; then
  disconnect
else
  exit
fi
