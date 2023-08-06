#!/bin/bash

# Set the path to your Waybar configuration file and style.css
WAYBAR_CONFIG_PATH="~/.config/hypr/waybar/config"
STYLE_CSS_PATH="~/.config/hypr/waybar/style.css"

# Launch Waybar with the specified configuration file and style.css
waybar -c "$~/.config/hypr/waybar/config" -s "~/.config/hypr/waybar/style.css"
