#!/bin/bash
export DISPLAY=:0.0

function connect(){
xrandr --output VGA-0 --auto --primary --pos 0x0 --output eDP --pos 1920x312
}

function disconnect(){
xrandr --output VGA-0 --off --output eDP --auto
}

function after_update(){
xmonad --restart
/scripts/wallaper.sh
}
exec &>> /home/anton/err

xrandr | grep "VGA-0 connected" && connect || disconnect

after_update
