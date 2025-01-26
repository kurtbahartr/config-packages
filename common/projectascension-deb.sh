#!/bin/bash

# Common script to install and launch Project Ascension on Deb-based distros.
# Mostly based on the manual on their website, generalized on fly.

# Project Ascension

# Step 1 - Installing dependencies
sudo apt install -y wine winetricks mono-complete libfuse2

# Step 2 - Setting up Ascension WINE bottle
export WINEPREFIX="$HOME/.config/projectascension/WoW"
export WINEARCH=win32

# Step 3 - Installing dependencies for WINE
mkdir -p "$WINEPREFIX" && cd "$WINEPREFIX"
curl --remote-name https://dl.winehq.org/wine/wine-mono/9.1.0/wine-mono-9.1.0-x86.msi
wine msiexec /i wine-mono-9.1.0-x86.msi
rm wine-mono-9.1.0-x86.msi
winetricks win10 ie8 corefonts dotnet48 vcrun2015

# Step 4 - Install DXVK
LATEST_DXVK_RELEASE_API=$(curl -sL https://api.github.com/repos/doitsujin/dxvk/releases/latest)
LATEST_DXVK_RELEASE_DOWNLOAD=$(echo "$LATEST_DXVK_RELEASE_API" | jq -r '.assets.[0].browser_download_url')
LATEST_DXVK_RELEASE_TARBALL=$(echo "$LATEST_DXVK_RELEASE_API" | jq -r '.assets.[0].name')
DXVK_TMPDIR=$(mktemp -d -t 'dxvk-XXXXXX')
cd "$DXVK_TMPDIR"
curl --remote-name -L "$LATEST_DXVK_RELEASE_DOWNLOAD"
tar -xvf "$LATEST_DXVK_RELEASE_TARBALL"
cd $(ls -I "$LATEST_DXVK_RELEASE_TARBALL")
cp x32/*.dll "$WINEPREFIX/drive_c/windows/system32"
winecfg

# Intermedietary step - Remove the temporary directory
cd "$HOME"
rm -rf "$DXVK_TMPDIR"

# Step 5 - Install our launcher
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/appimagelauncher-deb.sh)
curl -Lo ascension-launcher.appimage "https://api.ascension.gg/api/bootstrap/launcher/latest?unix"
chmod a+x ascension-launcher.appimage
echo "About to run Ascension Launcher. Please proceed within there to complete the setup!"
AppImageLauncher ascension-launcher.appimage&
echo "Disowning the process to proceed."
disown
exit
