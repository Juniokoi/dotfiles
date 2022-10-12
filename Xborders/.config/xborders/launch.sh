#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# Otherwise you can use the nuclear option:
killall -q xborders

# Launch bar1 
echo "---" | tee -a /tmp/xborders.log
xborders -c $HOME/.config/xborders/config.json 2>&1 | tee -a /tmp/xborders.log & disown

echo "Xborders launched..."
