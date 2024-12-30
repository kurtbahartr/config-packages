#!/bin/sh

# Common script to install AppImageLauncher from its GitHub repo.

# AppImageLauncher

# Identify if Ubuntu or not
[ "$(grep sid /etc/debian_version)" -eq "" ] && IS_UBUNTU=1 || IS_UBUNTU=0

# Grab the appropriate DEB file
if [ $IS_UBUNTU ]; then
  curl -o "appimagelauncher.deb" -sL https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
else
  curl -o "appimagelauncher.deb" -sL https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.xenial_amd64.deb
fi

# Install the DEB file and cleanup
sudo apt install -y ./appimagelauncher.deb && rm appimagelauncher.deb
