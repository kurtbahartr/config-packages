#!/bin/bash

# Common script to install and configure Telegram Desktop using an unofficial PPA repository.

# Telegram Desktop
DEBIAN_VERSION_CODENAME=$(grep VERSION_CODENAME /etc/os-release | sed 's/.*=//')
UBUNTU_DEBIAN_BASE_CODENAME=$(cat /etc/debian_version | sed 's/\/.*//')
UBUNTU_LTS_CODENAME=$(source <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/lib/dc2uc.sh) $DEBIAN_VERSION_CODENAME 2>&1 || source <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/lib/dc2uc.sh) $UBUNTU_DEBIAN_BASE_CODENAME)
sudo apt-key --keyring /etc/apt/trusted.gpg.d/ppa-telegram.gpg adv --keyserver keyserver.ubuntu.com --recv-key 25402D509B042DD9
sudo apt-key --keyring /etc/apt/trusted.gpg.d/ppa-telegram.gpg adv --keyserver keyserver.ubuntu.com --recv-key 6A9653F936FD5529
sudo add-apt-repository -y -S "deb https://ppa.launchpadcontent.net/atareao/telegram/ubuntu $UBUNTU_LTS_CODENAME main"
sudo apt install -y telegram
