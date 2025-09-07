#!/run/current-system/sw/bin/bash


# Handle both absolute and relative paths
if [[ "$1" = /* ]]; then
    wallpaper="$1"  # Already absolute path
else
    wallpaper="$(pwd)/$1"  # Make relative path absolute
fi

swww img $wallpaper

/home/callum/.wallpaperscript/activatemove.sh $wallpaper
