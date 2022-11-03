#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run /usr/bin/emacs --daemon
run picom --config $HOME/.config/picom.conf
