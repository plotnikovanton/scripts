#!/bin/bash

displaynum=`ls /tmp/.X11-unix/* | sed s#/tmp/.X11-unix/X##`
displaynum=0
export DISPLAY=":$displaynum.0"
export XAUTHORITY="/home/anton/.Xauthority"

con=($(xrandr -q | grep ' connected' | cut -d' ' -f1 | sed -e 's/\n/ /g'))

function refresh {
    /scripts/xmonad-restart.sh
	/scripts/wallaper.sh
}

function disconnect_disconnected {
	dis=($(xrandr -q | grep 'disconnected' | cut -d' ' -f1 | sed -e 's/\n/ /g'))
	for dev in ${dis[@]}; do
		xrandr --output $dev --off
    done
}


disconnect_disconnected

if [ ${#con[*]} -eq 2 ]; then
	# Connect two monitors
    xrandr --output ${con[0]} --primary --auto --output ${con[1]} --auto --left-of ${con[0]}
	refresh
elif [ ${#con[*]} -eq 1 ]; then
    xrandr --output ${#con[0]} --auto --primary
	refresh
fi
