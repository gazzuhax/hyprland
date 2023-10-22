#!/bin/bash

SCRIPTSDIR=$HOME/.config/hypr/scripts

# Kill already running process
_ps=(waybar mako)
for _prs in "${_ps[@]}"; do
	if [[ $(pidof ${_prs}) ]]; then
		killall -9 ${_prs}
	fi
done

# Lauch notification daemon (mako)
${SCRIPTSDIR}/Mako.sh &

# Lauch statusbar (waybar)
${SCRIPTSDIR}/rwaybar.sh &

# Terminate any running instance of Waybar
#killall -q waybar


# Wait for the process to be completely shut down
#while pgrep -x waybar >/dev/null; do sleep 1; done

# Set the environment variable for GTK to use the style.css
#export GDK_PIXBUF_MODULE_FILE=/path/to/style.css
# Launch Waybar with your desired configuration file (config.json)
# You should replace "config.json" with the path to your actual configuration file.
#/usr/bin/waybar -c /etc/xdg/waybar/config &

# Optionally, you can also launch any other applications you want to run at startup here.
# For example, to start a terminal emulator:
# gnome-terminal &

# The '&' at the end of each command runs it in the background.
# Add more startup applications as needed.
