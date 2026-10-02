#!/bin/bash

if [ "$INSTALL_OPTIONAL_PKGS" == "yes" ]; then
	sudo zypper install bc
else
	echo "skip..."
fi

sudo zypper install dmenu xclip maim playerctl kitty wmctrl xdotool ImageMagick

