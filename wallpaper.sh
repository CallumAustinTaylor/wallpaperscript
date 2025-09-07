#!/run/current-system/sw/bin/bash

wallpaper="$(pwd)/$1"

swww img $wallpaper

/home/callum/.wallpaperscript/activatemove.sh $wallpaper
