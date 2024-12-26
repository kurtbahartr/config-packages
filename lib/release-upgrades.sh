#!/bin/bash

# Release-Upgrades: Patches /etc/update-manager/release-upgrades
# This script does as it says, performs package upgrades and then runs:
#
#   do-release-upgrade
#
# The said patch basically sets the system for interim releases instead
# of having it stuck to LTS.
#
# Usage: /path/to/release-upgrades.sh

# Go to /etc/update-manager
cd /etc/update-manager || exit

# Patch release-upgrades config
patch -p1 <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/patches/release-upgrades.patch)

echo "Now your system is set to receive interim releases."
echo "Fasten your seat belts, because this will definitely take some time."
sudo apt update
sudo apt upgrade -y
sudo snap refresh
yes | sudo do-release-upgrade
