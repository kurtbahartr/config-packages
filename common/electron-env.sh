#!/bin/sh

# Common script to add ozone platform environment variable for Electron

# Electron-Env
sudo mkdir -p /etc/environment.d
echo "ELECTRON_OZONE_PLATFORM_HINT=auto" | sudo tee /etc/environment.d/90wayland-electron.conf
