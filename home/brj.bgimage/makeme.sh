#!/bin/sh

# imagemagick tile same image
# get display by xrandr | grep "*"

#convert 090127-2121-45.bmp -write mpr:tile  +delete -size 1366x768 tile:mpr:tile brj_wallpaper.jpg
convert 090127-2121-45.bmp -write mpr:tile  +delete -size 1920x1080 tile:mpr:tile brj_wallpaper.jpg

sudo cp brj_wallpaper.jpg /usr/share/backgrounds/linuxmint
rm brj_wallpaper.jpg
