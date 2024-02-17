#!/bin/fish

# pkill pipewire
pkill swww
pkill eww

# pipewire &
# wireplumber &
dex -a
swww-daemon &
swww img ~/Media/Pictures/Wallpapers/w3.jpg
eww daemon &
eww -c ~/.config/eww open win --screen 0 &

