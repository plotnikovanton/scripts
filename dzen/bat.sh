#!/bin/bash

acpi_output=`acpi`
level=`egrep -o " ([0-9]){1,3}%" <<< $acpi_output | sed 's/[ %]//g'`

if grep -q Discharging <<< $acpi_output; then
    if [ $level -lt 5 ]; then
        icon=
    elif [ $level -lt 30 ]; then
        icon=
    elif [ $level -lt 55 ]; then
        icon=
    elif [ $level -lt 80 ]; then
        icon=
    else
        icon=
    fi
else
    icon=
fi

icon_font="FontAwesome:size=9"
default_font="xos4 Terminus:size=8"
echo "^fn($icon_font)$icon^fn($default_font)" $level%
