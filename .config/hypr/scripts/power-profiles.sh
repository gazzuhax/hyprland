#!/usr/bin/env bash
set -x
#
# power-profiles-daemon implementation:
# needs package power-profiles-daemon installed and the service running. See here:
# https://wiki.archlinux.org/title/CPU_frequency_scaling#power-profiles-daemon

# Function to set the power profile
set_power_profile() {
  /usr/bin/powerprofilesctl set "$1" > /dev/null
  notify-send "Power Profile Set" "Power profile set to $1."
}

# Function to get the current power profile
get_power_profile() {
  current_profile=$(/usr/bin/powerprofilesctl get)
  notify-send "Current Power Profile" "Current power profile: $current_profile"
}

# Menu with keys/commands
menu=(
  [1]=" Performance"
  [2]=" Balanced"
  [3]=" Power Saver"
  [4]=" Get Power Profile"
  [5]=" Cancel"
)

# Prompt for user choice using rofi with the custom theme file
choice=$(printf '%s\n' "${menu[@]}" | rofi -dmenu -i -p "Select power profile:" \
  -theme ~/.config/rofi/power-profiles.rasi)

# Check user's choice and take appropriate action
case "$choice" in
  " Performance") set_power_profile "performance"
                 ;;
  " Balanced") set_power_profile "balanced"
              ;;
  " Power Saver") set_power_profile "power-saver"
                 ;;
  " Get Power Profile") get_power_profile
                       ;;
  " Cancel") notify-send "Operation Canceled" "Operation canceled."
            exit 0
            ;;
  *) notify-send "Invalid Choice" "Invalid choice. Exiting."
     exit 1
     ;;
esac
