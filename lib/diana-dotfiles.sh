#!/bin/bash

# Diana-dotfiles: Patched version of Diana's Archlinux configuration
# This script is here as a one-stop shop to get Diana's dotfiles repo
# and patch the variables to my own needs.
#
# Usage: /path/to/diana-dotfiles.sh [novideo|nvidia]
#
# novideo: Keeps proprietary_drivers variable at default, which is false, and installs less packages. (backup laptop)
# nvidia: Sets proprietary_drivers to true, and installs more packages. (main laptop)

# Go to the home directory just in case
cd ~ || exit

# Install curl just in case as well
sudo pacman -Sy --noconfirm curl

# Prepare for rolling release of Diana's dotfiles
bash <(curl -s https://raw.githubusercontent.com/dianaw353/dotfiles/main/dotfiles.sh) developer
cd dotfiles || exit

# Patch variables using the premade patch files
if [ "$1" == "nvidia" ]; then
    patch -p1 <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/patches/diana-dotfiles-nvidia.patch)
else
    patch -p1 <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/patches/diana-dotfiles.patch)
fi

echo "Running checks before the real deal."
echo "The BECOME password is Ansible's term for your sudo password. Make sure to enter it properly."
ansible-playbook main.yml --ask-become-pass --check

echo "Checks pass. Getting to the real deal."
echo "The BECOME password is Ansible's term for your sudo password. Make sure to enter it properly."
echo "You may also want to keep track of the output and enter your sudo password when asked."
ansible-playbook main.yml --ask-become-pass
