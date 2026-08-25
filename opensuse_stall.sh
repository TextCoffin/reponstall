#!/bin/bash

cd ~/vxwm
git clone -b custom https://github.com/TextCoffin/vxwm-keybinds-config.git
rm -rf config.h
mv ~/vxwm/vxwm-keybinds-config/config.h ~/vxwm
mv ~/vxwm/vxwm-keybinds-config/custom ~/vxwm
rm -rf ~/vxwm/vxwm-keybinds-config
sudo make clean install
echo "keybinds for vxwm installed succsessful!"

read -p "do you want to install vcompmgr? (y/n): " answer

case "$answer" in
  [yY] )
	echo "y"
git clone https://codeberg.org/wh1tepearl/vcompmgr.git
cd vcompmgr/
make
sudo make install
sudo zypper install bc
	;;
  [nN] )
    echo "n"
    exit 0
    ;;
  * )
    echo "invalid type"
    ;;
esac
#program for work keybinds
sudo zypper install dmenu xclip maim playerctl kitty wmctrl xdotool imagemagick
