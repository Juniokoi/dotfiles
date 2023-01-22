#!/usr/bin/env bash

function run {
  if ! pgrep -f $1; then
    $@&
  fi
}

run /usr/bin/emacs --daemon
run setxkbmap -model pc104 -layout us,br -variant qwerty -option grp:win_space_toggle ctrl:swapcaps
run picom --config $HOME/.config/picom.conf
