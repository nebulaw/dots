#!/bin/fish

pkill pipewire
pkill swww
pkill eww

swww-daemon &
swww img ~/Media/Pictures/Wallpapers/debili.jpg
eww daemon &
eww -c ~/.config/eww open win --screen 0 &

pipewire &
wireplumber &

ulauncher &
# xsettingsd &

