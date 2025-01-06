#!/bin/sh

# Common script to install and configure Tailscale.

# Tailscale
# Comment out below if you don't want to cause jank with other processes somehow
sudo cp /etc/os-release{,.bak}
sudo sed -i '/UBUNTU_CODENAME/ s/devel/oracular/' /etc/os-release
curl -fsSL https://tailscale.com/install.sh | sh
sudo mv /etc/os-release{.bak,}
# Comment out below if you don't want to bring Tailscale up as soon as it's installed above.
sudo tailscale up

