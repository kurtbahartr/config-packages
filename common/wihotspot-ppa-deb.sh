#!/bin/bash

# Common script to install and configure Linux Wifi Hotspot.

# Wihotspot
DEBIAN_VERSION_CODENAME=$(grep VERSION_CODENAME /etc/os-release | sed 's/.*=//')
UBUNTU_DEBIAN_BASE_CODENAME=$(cat /etc/debian_version | sed 's/\/.*//')
UBUNTU_LTS_CODENAME=$(source <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/lib/dc2uc.sh) $DEBIAN_VERSION_CODENAME 2>&1 || source <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/lib/dc2uc.sh) $UBUNTU_DEBIAN_BASE_CODENAME)
sudo add-apt-repository -y ppa:lakinduakash/lwh
if [ "$?" != "0" ]; then
  sudo apt-key --keyring /etc/apt/trusted.gpg.d/ppa-linux-wifi-hotspot.gpg adv --keyserver keyserver.ubuntu.com --recv-key 87B8838C5E2893D3 && \
  sudo add-apt-repository -y -S "deb https://ppa.launchpadcontent.net/lakinduakash/lwh/ubuntu $UBUNTU_LTS_CODENAME main"
fi
sudo apt -y install linux-wifi-hotspot haveged
