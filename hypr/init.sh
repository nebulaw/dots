#!/bin/fish

pkill pipewire
pkill wireplumber
pkill swww
pkill eww

pipewire &
wireplumber &
swww-daemon &
swww img ~/Media/Pictures/Wallpapers/w1.jpg
eww daemon &
eww -c ~/.config/eww open win --screen 0 &

