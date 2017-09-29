#!/bin/bash

# XKB keyboard layout configuration
export XKB_DEFAULT_LAYOUT=us,ru
export XKB_DEFAULT_VARIANT=dvp,diktor
export XKB_DEFAULT_OPTIONS=grp:rctrl_toggle

# Enable native wayland support for application
export GDK_BACKEND=wayland
export CLUTTER_BACKEND=wayland
export GTK_CSD=1

export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ENGINE=wayland_egl

export SDL_VIDEODRIVER=wayland

export _JAVA_AWT_WM_NONREPARENTING=1

sway
