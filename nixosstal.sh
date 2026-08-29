 #!/bin/bash

# Find hash for vxwm and paste it in hash.txt
nix --extra-experimental-features nix-command --extra-experimental-features flakes run nixpkgs#nix-prefetch-git -- --url https://codeberg.org/wh1tepearl/vxwm.git --rev refs/heads/main 2>&1 | grep -oP 'hash: \K.*' > /tmp/hash.txt

# Delete 1-5 and 7th lines in /etc/nixos/configuration.nix
sed -i '1d' /etc/nixos/configuration.nix
sed -i '2d' /etc/nixos/configuration.nix
sed -i '3d' /etc/nixos/configuration.nix
sed -i '4d' /etc/nixos/configuration.nix
sed -i '5d' /etc/nixos/configuration.nix
sed -i '7d' /etc/nixos/configuration.nix

# Copying vstavka.txt in /tmp/temp.txt
curl -s -o /tmp/temp.txt https://raw.githubusercontent.com/prizduk/vxwm-on-NixOS/refs/heads/main/vstavka.txt

# Paste vstavka.txt at the beginning of the configuration.nix
printf '0r /tmp/temp.txt\nw\nq' | nix-shell -p ed --run  'ed -s /etc/nixos/configuration.nix'

# Delete trash file /tmp/temp.txt
rm /tmp/temp.txt

# Paste 'hash' from hash.txt in configuration.nix ( DON'T WORK NOW! )
awk -v r="$(cat /tmp/hash.txt)" '{gsub(/"00000000000000000000000000000000";/, r)}1' /etc/nixos/configuration.nix > tmp && mv tmp /etc/nixos/configuration.nix

# Delete trash file /tmp/hash.txt
rm /tmp/hash.txt

# Tip if 'awk -v r="$(cat /tmp/hash.txt)" '{gsub(/"00000000000000000000000000000000";/, r)}1' /etc/nixos/configuration.nix > tmp && mv tmp /etc/nixos/configuration.nix' doesn't work
echo "Run 'nixos-rebuild switch' and then copy/paste expected hash into "hash: "sha256-";", and run 'nixos-rebuild' again"
