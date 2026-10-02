#!/bin/bash

# LITERALLY CHECK do you have vxwm
if grep -q "pname = "vxwm";" /etc/nixos/configuration.nix; then
   echo "you already have vxwm" || exit 1
else
   echo "you don't have vxwm ._."
fi

# idk не придумал, придумайте чето тут ↓↓↓

# Copying vstavka.txt and paste it in /tmp/temp.txt
curl -s -o /tmp/temp.txt https://raw.githubusercontent.com/prizduk/vxwm-on-NixOS/refs/heads/main/vstavka.txt

# Delete trash lines
sed -i '1,/{ config, pkgs/d' /etc/nixos/configuration.nix

# Paste vstavka.txt at the beginning of the configuration.nix
printf '0r /tmp/temp.txt\nw\nq' | nix-shell -p ed --run  'ed -s /etc/nixos/configuration.nix'

# Delete trash file /tmp/temp.txt
rm /tmp/temp.txt

# Delete trash file /tmp/hash.txt
rm /tmp/hash.txt

echo "vxwm was installed"
