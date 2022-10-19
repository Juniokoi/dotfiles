#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# Otherwise you can use the nuclear option:
killall -q eww

# Launch bar1 
echo "---" | tee -a /tmp/eww.log
eww 2>&1 | tee -a /tmp/eww.log & disown

echo "Eww launched..."
