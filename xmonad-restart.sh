#!/bin/bash
killall xmobar 
xmonad --recompile && xmonad --restart
