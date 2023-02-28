#!/bin/bash

wallpaper=$HOME/Pictures/.wallpapers/miku.jpg

not_open() {
	pgrep -f swww > /dev/null
}

if not_open; then
	swww init
	sleep 1
fi

swww img "$wallpaper"
