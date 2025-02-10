#!/bin/bash

# Common script to download and install LocalSend on DEB-based distros.

# LocalSend-DEB
LATEST_LOCALSEND_RELEASE_DOWNLOAD=$(curl -sL https://api.github.com/repos/localsend/localsend/releases/latest | jq -r '.assets.[].browser_download_url' | grep linux-x86-64.deb)
LATEST_LOCALSEND_RELEASE_DEB=$(curl -sL https://api.github.com/repos/localsend/localsend/releases/latest | jq -r '.assets.[].name' | grep linux-x86-64.deb)

curl -L --remote-name $LATEST_LOCALSEND_RELEASE_DOWNLOAD
sudo apt install -y ./$LATEST_LOCALSEND_RELEASE_DEB
rm $LATEST_LOCALSEND_RELEASE_DEB
