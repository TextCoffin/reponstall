 #!/bin/bash

nix --extra-experimental-features nix-command --extra-experimental-features flakes run nixpkgs#nix-prefetch-git -- --url https://codeberg.org/wh1tepearl/vxwm.git --rev refs/heads/main 2>&1 | grep -oP 'hash: \K.*' > /tmp/hash.txt
sed -i '1d' /etc/nixos/configuration.nix
sed -i '2d' /etc/nixos/configuration.nix
sed -i '3d' /etc/nixos/configuration.nix
sed -i '4d' /etc/nixos/configuration.nix
sed -i '5d' /etc/nixos/configuration.nix
sed -i '6d' /etc/nixos/configuration.nix
sed -i '7d' /etc/nixos/configuration.nix
curl -s -o /tmp/temp.txt https://raw.githubusercontent.com/prizduk/vxwm-on-NixOS/refs/heads/main/vstavka.txt
printf '0r /tmp/temp.txt\nw\nq' | nix-shell -p ed --run  'ed -s /etc/nixos/configuration.nix'
rm /tmp/temp.txt
awk -v r="$(cat /tmp/hash.txt)" '{gsub(/"00000000000000000000000000000000";/, r)}1' /etc/nixos/configuration.nix > tmp && mv tmp /etc/nixos/configuration.nix
rm /tmp/hash.txt
echo "Run 'nixos-rebuild switch' and then copy/paste expected hash into "hash: "sha256-";", and run 'nixos-rebuild' again"
