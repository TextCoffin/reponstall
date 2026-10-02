#!/bin/bash

if [ "$INSTALL_OPTIONAL_PKGS" == "yes" ]; then
	sudo pacman -S bc
else
	echo "skip..."
fi

sudo pacman -S dmenu xclip maim playerctl kitty wmctrl xdotool imagemagick

