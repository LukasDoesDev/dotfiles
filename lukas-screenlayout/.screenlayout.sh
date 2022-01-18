#!/bin/sh
#xrandr \
#  --output HDMI-1 --primary --auto \
#  --output DP-1 --auto --left-of HDMI-1 \
#  --output DVI-D-1 --auto --above HDMI-1 \
#  --output DVI-I-1 --auto --right-of HDMI-1
# The `radeon` driver uses adobe and `amdgpu` uses below
xrandr \
  --output HDMI-A-0 --primary --auto \
  --output DisplayPort-0 --auto --left-of HDMI-A-0 \
  --output DVI-D-0 --auto --above HDMI-A-0 \
  --output DVI-I-1 --auto --right-of HDMI-A-0

