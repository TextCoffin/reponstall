cd ~/vxwm
git clone -b custom https://github.com/TextCoffin/vxwm-keybinds-config.git
rm -rf config.h
mv ~/vxwm/vxwm-keybinds-config/config.h ~/vxwm
mv ~/vxwm/vxwm-keybinds-config/custom ~/vxwm
rm -rf ~/vxwm/vxwm-keybinds-config
sudo make clean install
git clone https://codeberg.org/wh1tepearl/vcompmgr.git
cd vcompmgr/
make
sudo make install
#program for work keybinds
sudo pacman -S dmenu xclip maim playerctl kitty wmctrl xdotool imagemagick bc
