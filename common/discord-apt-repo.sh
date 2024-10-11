#!/bin/sh

# Common script to install Discord from an unofficially maintained APT repo.

# Discord
sudo wget -O /etc/apt/trusted.gpg.d/discord-apt.gpg.asc https://palfrey.github.io/discord-apt/discord-apt.gpg.asc
echo "deb https://palfrey.github.io/discord-apt/debian/ ./" | sudo tee /etc/apt/sources.list.d/discord.list > /dev/null
sudo apt update
sudo apt -y install discord

