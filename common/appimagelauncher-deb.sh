#!/bin/sh

# Common script to install AppImageLauncher from its GitHub repo.

# AppImageLauncher

# Grab the appropriate DEB file
if (grep sid /etc/debian_version && grep -i ubuntu /etc/os-release) > /dev/null; then
  curl -o "appimagelauncher.deb" -sL https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
else
  curl -o "appimagelauncher.deb" -sL https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.xenial_amd64.deb
fi

# Install the DEB file and cleanup
sudo apt install -y ./appimagelauncher.deb && rm appimagelauncher.deb
