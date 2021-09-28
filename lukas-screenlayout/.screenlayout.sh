#!/bin/sh
xrandr \
  --output HDMI-1 --primary --auto \
  --output DP-1 --auto --left-of HDMI-1 \
  --output DVI-D-1 --auto --above HDMI-1 \
  --output DVI-I-1 --auto --right-of HDMI-1

