#!/usr/bin/env bash

## Resume:
## 1. Caps_Lock to act as Ctrl_L
## 2. Ctrl_R to act as Caps_Lock
## 3. Ctrl_L to act as compose
## 4. Super_R to act as Super_R

# Reset keyboard to default
setxkbmap -option
# Make both control act as Capslock, lctrl and super as compose
setxkbmap -option "caps:ctrl_modifier,compose:lctrl"

## 66 = capslock, force capslock to act as Ctrl_L
xmodmap -e "clear lock" -e "keycode 66 = Control_L"
#
## force Ctrl_R to act as Caps_Lock
xmodmap -e "keycode 105 = Caps_Lock"

## Restore Super key to act only as Super key
xmodmap -e "keycode 133 = Super_R"
xset r rate 250 45
