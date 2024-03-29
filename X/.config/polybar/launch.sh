#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

bar=${1:-mybar}

# Launch Polybar, using default config location ~/.config/polybar/config
polybar $bar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
