#!/bin/fish

set -gx GRIM_DEFAULT_DIR ~/Media/Pictures/Screenshots

pkill jackdbus
pkill pipewire
pkill wireplumber
pkill swww
pkill eww

pipewire &
wireplumber &
swww-daemon &
swww img ~/Media/Pictures/Wallpapers/w3.jpg
eww daemon &
eww -c ~/.config/eww open win --screen 0 &

