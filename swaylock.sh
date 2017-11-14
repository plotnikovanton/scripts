#!/bin/env bash

swaygrab /home/$USER/.cache/lockscreen.png
convert -blur 0x6 /home/$USER/.cache/lockscreen.png /home/$USER/.cache/lockscreen.png

swaylock \
    --keyhlcolor b8bb26 --ringcolor 98971a \
    --ringvercolor 458588 --insidevercolor 83a598 \
    --ringwrongcolor cc241d --insidewrongcolor fb4934 \
    -i /home/$USER/.cache/lockscreen.png
