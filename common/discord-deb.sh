#!/bin/sh

# Common script to install Discord from an unofficially maintained APT repo.

# Discord
curl --remote-name -sL https://palfrey.github.io/discord-apt/discord-repo_1.0_all.deb
sudo apt install -y ./discord-repo_1.0_all.deb
sudo apt update
sudo apt -y install discord-canary
