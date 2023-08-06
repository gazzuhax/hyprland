#!/usr/bin/env bash
set -x
#
# power-profiles-daemon implementation:
# needs package power-profiles-daemon installed and the service running see here:
# https://wiki.archlinux.org/title/CPU_frequency_scaling#power-profiles-daemon
# used in i3-blocks: ~/.config/i3/i3blocks.conf together with: ~/.config/i3/scripts/power-profiles

# Function to set the power profile
set_power_profile() {
  /usr/bin/powerprofilesctl set "$1" > /dev/null
}

# Menu with keys/commands
menu=(
  [1]="Performance"
  [2]="Balanced"
  [3]="Power Saver"
  [4]="Cancel"
)

# Prompt for user choice using rofi with the custom theme file
choice=$(printf '%s\n' "${menu[@]}" | rofi -dmenu -i -p "Select power profile:" \
  -theme ~/.config/rofi/power-profiles.rasi)

# Check user's choice and set power profile accordingly
case "$choice" in
  "Performance") set_power_profile "performance"
                 echo "Power profile set to performance."
                 ;;
  "Balanced") set_power_profile "balanced"
              echo "Power profile set to balanced."
              ;;
  "Power Saver") set_power_profile "power-saver"
                 echo "Power profile set to power-saver."
                 ;;
  "Cancel") echo "Operation canceled."
            exit 0
            ;;
  *) echo "Invalid choice. Exiting."
     exit 1
     ;;
esac

# Get the current power profile
current_profile=$(/usr/bin/powerprofilesctl get)
echo "Current power profile: $current_profile"
