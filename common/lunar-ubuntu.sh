#!/bin/sh

# Common script to patch the Ubuntu-specific script for
# Lunar Shell for client use.
#
# Lunar Shell itself is aimed towards servers and does
# much more than setting up a shell. This patch is made
# to modify it in a way that sanitizes it for client use
# case.
#
# Lunar Shell is developed by Luna (ohemilyy on GitHub).
# Client use-case patch is maintained by Linda St-Denis.

# Lunar-Ubuntu
curl --remote-name -L https://shell.lunarlabs.cc/src/distros/ubuntu.sh
curl --remote-name -L https://shell.lunarlabs.cc/asset/sysctl.conf
patch -p1 < <(https://raw.githubusercontent.com/kurtbahartr/config-packages/master/patches/lunar-ubuntu.patch)
sudo cp /etc/sysctl.conf{,.bak}
sudo bash ubuntu.sh
rm ubuntu.sh
rm sysctl.conf
echo -e "\nLunar Shell also configures /etc/sysctl.conf for network security and several QoL improvements."
echo "If you don't like the current configuration and think it's because of this config change, I created a backup for you in the same directory with a .bak extension."
