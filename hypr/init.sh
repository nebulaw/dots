#!/bin/fish

pkill pipewire
pkill swww
pkill eww

swww-daemon &
swww img ~/Media/Pictures/Wallpapers/w5.png
eww daemon &
eww -c ~/.config/eww open win --screen 0 &

pipewire &
wireplumber &

ulauncher &
# xsettingsd &

