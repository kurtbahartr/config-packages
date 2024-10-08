#!/bin/sh

# Common script to install and configure Tailscale.

# Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
# Comment out below if you don't want to bring Tailscale up as soon as it's installed above.
sudo tailscale up

