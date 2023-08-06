#!/usr/bin/env bash
#
# power-profiles-daemon implementation:
# needs package power-profiles-daemon installed and the service running see here:
# https://wiki.archlinux.org/title/CPU_frequency_scaling#power-profiles-daemon
# used in i3-blocks: ~/.config/i3/i3blocks.conf together with: ~/.config/i3/scripts/power-profiles

# Set the power profile to performance
/usr/bin/powerprofilesctl set performance > /dev/null

# Get the current power profile
current_profile=$(/usr/bin/powerprofilesctl get)
echo "Current power profile: $current_profile"
