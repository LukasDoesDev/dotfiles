#!/bin/bash

while true; do
  status="$(~/.dwm/status.sh)"
  xsetroot -name "$status"
  sleep 10s
done
