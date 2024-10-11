#!/bin/sh

# Common script to install Discord from an unofficially maintained APT repo.

# Discord
sudo wget -O {,https://github.com/kurtbahartr/config-rootfs/raw/master/common-deb}/etc/apt/sources.list.d/discord.sources
(echo -n "Signed-By:" && curl -sL https://palfrey.github.io/discord-apt/discord-apt.gpg.asc | sed 's/^/ /') | sudo tee -a /etc/apt/sources.list.d/discord.sources > /dev/null
sudo apt update
sudo apt -y install discord

