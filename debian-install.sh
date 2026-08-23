sudo apt install dmenu xclip maim playerctl kitty wmctrl xdotool imagemagick bc
git clone https://codeberg.org/wh1tepearl/vxwm.git
cd vxwm
rm -rf config.h
git clone https://github.com/TextCoffin/vxwm-keybinds-config.git
mv vxwm-keybinds-config/config.h ~/vxwm
#mv vxwm-keybinds-config/custom
rm -rf vxwm-keybinds-config
make
sudo make clean install
cd
#zoom
#git clone https://codeberg.org/wh1tepearl/vcompmgr.git
#cd vcompmgr
#make
#sudo make install
