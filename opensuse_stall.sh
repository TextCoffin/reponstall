<<<<<<< HEAD
#!/bin/bash

=======
>>>>>>> 743e049db8afd5e2234dbf49e80e557976be0562
cd ~/vxwm
git clone -b custom https://github.com/TextCoffin/vxwm-keybinds-config.git
rm -rf config.h
mv ~/vxwm/vxwm-keybinds-config/config.h ~/vxwm
mv ~/vxwm/vxwm-keybinds-config/custom ~/vxwm
rm -rf ~/vxwm/vxwm-keybinds-config
sudo make clean install
<<<<<<< HEAD
echo "keybinds for vxwm installed succsessful!"

read -p "do you want vcompmgr? (y/n): " answer

case "$answer" in
  [yY] )
	echo "y"
=======
>>>>>>> 743e049db8afd5e2234dbf49e80e557976be0562
git clone https://codeberg.org/wh1tepearl/vcompmgr.git
cd vcompmgr/
make
sudo make install
<<<<<<< HEAD
	;;
  [nN] )
    echo "y"
    exit 0
    ;;
  * )
    echo "invalid type"
    ;;
esac
=======
#program for work keybinds
sudo zypper install dmenu xclip maim playerctl kitty wmctrl xdotool imagemagick bc
>>>>>>> 743e049db8afd5e2234dbf49e80e557976be0562
