#!/bin/bash

#LITERALLY CHECK do you have vxwm
if [ -d ~/vxwm ]; then
	cd ~/vxwm || exit 1
else
	echo "you dont have vxwm ._."
fi


#for speed
rm_mv() {
	rm -rf config.h
	mv ~/vxwm/vxwm-keybinds-config/config.h ~/vxwm
}


#SAVE
read -p "do you want save your config.h? (Y/n): " answer
case "$answer" in
	[yY]* | "" )
	echo "y"
BACKUP_NAME="config$(date +'%Y_%d%m_%H%M%S').h"

if [ -d save/ ]; then
	mv config.h save/$BACKUP_NAME
else
	mkdir save
	mv config.h save/$BACKUP_NAME
fi
	;;
	[nN]* )
	echo "n" || exit 1
	;;
	* )
	echo "invalid type"
	exit 0
	;;
esac


echo "what do you wanna install?"
echo "main or custom(more content)"
read -p "(m/C): " answer
case "$answer" in
	[mM]* )
	echo "m"
#MAIN INSTALLING
git clone https://github.com/TextCoffin/vxwm-keybinds-config.git
rm_mv
	echo "main installed!"
	;;
	[cC]* | "" )

#CUSTOM INSTALLING
git clone -b custom https://github.com/TextCoffin/vxwm-keybinds-config.git
rm_mv
mv ~/vxwm/vxwm-keybinds-config/custom ~/vxwm
	echo "custom installed!"
	;;
	* )
	echo "invalid type"
	;;
esac

#SUCCESS
rm -rf ~/vxwm/vxwm-keybinds-config
sudo make clean install
echo "keybinds for vxwm installed succsessful!"


#VCOMPMGR
read -p "do you wanna install vcompmgr? (y/N): " answer
case "$answer" in
	[yY]* )
	echo "y"

git clone https://codeberg.org/wh1tepearl/vcompmgr.git
cd vcompmgr/
make
sudo make install
sudo zypper install bc
	
	echo "vcompmgr installed!"
	;;
	[nN]* | "")
	echo "N (recomended)" || exit 1
	;;
	* )
	echo "invalid type"
	exit 0
	;;
esac


#INSTALLING
#program for work keybinds
sudo zypper install dmenu xclip maim playerctl kitty wmctrl xdotool ImageMagick

echo "SUCCESS"
