#!/bin/sh

# Common script to install and configure Speedtest CLI by Ookla.

# Speedtest CLI by Ookla
UBUNTU_DEBIAN_BASE_CODENAME=$(cat /etc/debian_version | sed 's/\/.*//; /[0-9]/d')
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo $(if [ "$UBUNTU_DEBIAN_BASE_CODENAME" != "" ]; then echo "os=debian dist=$UBUNTU_DEBIAN_BASE_CODENAME"; fi) bash
sudo apt update
sudo apt install speedtest
