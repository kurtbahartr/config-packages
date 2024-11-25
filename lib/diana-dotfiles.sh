#!/bin/bash

# Diana-dotfiles: Patched version of Diana's Archlinux configuration
# This script is here as a one-stop shop to get Diana's dotfiles repo
# and patch the variables to my own needs.
#
# Usage: /path/to/diana-dotfiles.sh

# Go to the home directory just in case
cd ~

# Install curl just in case as well
sudo pacman -Sy --noconfirm curl

# Prepare for rolling release of Diana's dotfiles
bash <(curl -s https://raw.githubusercontent.com/dianaw353/dotfiles/main/dotfiles.sh) rolling
cd dotfiles

# Patch variables using the premade patch file
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/patches/diana-dotfiles.patch | patch -p1

echo "Running checks before the real deal."
echo "The BECOME password is Ansible's term for your sudo password. Make sure to enter it properly."
ansible-playbook main.yml --ask-become-pass --check || exit 1

echo "Checks pass. Getting to the real deal."
echo "The BECOME password is Ansible's term for your sudo password. Make sure to enter it properly."
echo "You may also want to keep track of the output and enter your sudo password when asked."
ansible-playbook main.yml --ask-become-pass
