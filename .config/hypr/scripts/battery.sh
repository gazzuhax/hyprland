#!/bin/bash

# Command to get battery capacity (percentage)
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)

# Command to get battery status (charging, discharging, full, etc.)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Battery icon based on capacity
if ((battery_capacity >= 95)); then
  battery_icon=""
elif ((battery_capacity >= 75)); then
  battery_icon=""
elif ((battery_capacity >= 50)); then
  battery_icon=""
elif ((battery_capacity >= 25)); then
  battery_icon=""
else
  battery_icon=""
fi

# Battery status text
if [ "$battery_status" == "Charging" ]; then
  battery_status_text="⚡️ Charging"
elif [ "$battery_status" == "Full" ]; then
  battery_status_text=" Full"
else
  battery_status_text=" $battery_capacity%"
fi

# Return the JSON formatted battery status
echo "{\"icon\": \"$battery_icon\", \"capacity\": \"$battery_status_text\"}"
