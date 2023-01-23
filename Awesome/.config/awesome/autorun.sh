#!/usr/bin/env bash

function run {
  if ! pgrep -f $1; then
    $@&
  fi
}

run /usr/bin/emacs --daemon
run xrandr --output HDMI-A-0 --primary --mode 2560x1080 --pos 0x0 --output DisplayPort-0 --mode 1920x1080 --pos 0x1080
run setxkbmap -model pc104 -layout us,br -variant qwerty -option grp:win_space_toggle ctrl:swapcaps
run picom --config $HOME/.config/picom.conf
