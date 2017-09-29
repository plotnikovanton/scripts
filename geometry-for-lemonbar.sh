#!/bin/bash
geometry=$(xrandr | grep primary | cut -d' ' -f4)
if [[ $geometry == '' ]]; then
    geometry=$(xrandr | grep ' connected' | head -n 1 | cut -d' ' -f3)
fi
width=$(cut -d'x' -f1 <<< $geometry)
offsetX=$(sed -r 's/.*[+-](.+)[+-].+/\1/' <<< $geometry)
offsetX=$(expr $offsetX + 4)
width=$(expr $width - 8)
echo ${width}x18+${offsetX}+0

