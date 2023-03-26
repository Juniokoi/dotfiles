not_open() {
	pgrep -f i3lock > /dev/null
}

exec i3lock -feti $HOME/Pictures/.wallpapers/miku.png

sleep 5
if not_open; then
	systemctl suspend
fi
