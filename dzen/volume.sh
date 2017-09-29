#!/bin/bash

level=`pamixer --get-volume`
mute=`pamixer --get-mute`

if [[ $mute == "false" ]]; then
    if [ $level -lt 65 ]; then
        icon=
    else
        icon=
    fi
else
    icon='^fg(#cc6666)^fg()'
fi

icon_font="FontAwesome:size=9"
default_font="xos4 Terminus:size=8"
echo "^fn($icon_font)$icon^fn()" $level%
