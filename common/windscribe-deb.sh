#!/bin/sh

# Common script to install Windscribe from Windscribe's own website.

# Windscribe
wget -O windscribe-debian-latest.deb https://windscribe.com/install/desktop/linux_deb_x64
sudo apt -y install desktop-file-utils ./windscribe-debian-latest.deb
rm windscribe-debian-latest.deb
