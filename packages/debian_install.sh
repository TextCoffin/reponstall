#!/bin/bash

if [ "$INSTALL_OPTIONAL_PKGS" == "yes"]; then
	sudo apt install bc
else
	echo "skip..."
fi

sudo apt install dmenu xclip maim playerctl kitty wmctrl xdotool imagemagick 
