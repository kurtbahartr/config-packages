#!/bin/bash

# Common script to install and configure Linux Wifi Hotspot.

# Wihotspot
DEBIAN_VERSION_CODENAME=$(grep VERSION_CODENAME /etc/os-release | sed 's/.*=//')
sudo add-apt-repository -y ppa:lakinduakash/lwh || \
    sudo apt-key --keyring /etc/apt/trusted.gpg.d/ppa-linux-wifi-hotspot.gpg adv --keyserver keyserver.ubuntu.com --recv-key 87B8838C5E2893D3 && \
    sudo add-apt-repository -y -S "deb https://ppa.launchpadcontent.net/lakinduakash/lwh/ubuntu $(curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/lib/dc2uc.sh | source /dev/stdin $DEBIAN_VERSION_CODENAME) main"
sudo apt -y install linux-wifi-hotspot haveged
