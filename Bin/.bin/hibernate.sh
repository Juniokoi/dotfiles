not_open() {
	pgrep -f swaylock > /dev/null
}

swaylock -fei ~/Pictures/.wallpapers/miku.jpg
sleep 5
if not_open; then
	systemctl suspend
fi
