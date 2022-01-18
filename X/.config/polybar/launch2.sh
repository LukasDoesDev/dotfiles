#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

bar=${1:-bar}

# Launch Polybar, using default config location ~/.config/polybar/config
polybar $bar

