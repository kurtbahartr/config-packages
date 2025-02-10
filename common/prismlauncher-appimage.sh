#!/bin/bash

# Common script to integrate and launch Prism Launcher using
# AppImageLauncher.

# Prism Launcher
LATEST_PRISMLAUNCHER_RELEASE_API=$(curl -sL https://api.github.com/repos/PrismLauncher/PrismLauncher/releases/latest)
LATEST_PRISMLAUNCHER_RELEASE_DOWNLOAD=$(echo "$LATEST_DXVK_RELEASE_API" | jq -r '.assets.[3].browser_download_url')
LATEST_PRISMLAUNCHER_RELEASE_TARBALL=$(echo "$LATEST_DXVK_RELEASE_API" | jq -r '.assets.[3].name')
curl -L -o prismlauncher.appimage "$LATEST_PRISMLAUNCHER_RELEASE_DOWNLOAD"
chmod a+x prismlauncher.appimage
echo "About to run Prism Launcher. Please proceed within there to complete the setup!"
AppImageLauncher prismlauncher.appimage&
echo "Disowning the process to proceed."
disown
exit
