#!/bin/bash

# Kill the existing Waybar process (if running)
if pgrep -x "waybar" > /dev/null; then
  pkill waybar
  sleep 1 # Wait for 1 second to allow Waybar to gracefully terminate
  echo "Waybar killed."
fi

# Start Waybar using the specified path
if [ -x /usr/bin/waybar ]; then
  nohup /usr/bin/waybar > /dev/null 2>&1 &
  echo "Waybar started."
else
  echo "Waybar executable not found. Make sure the path is correct."
fi
