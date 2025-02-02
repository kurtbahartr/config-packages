#!/bin/sh

# Common script to install Discord from an unofficially maintained APT repo.

# Discord
curl --remote-name -sL https://palfrey.github.io/discord-apt/discord-repo_1.0_all.deb
sudo apt install -y ./discord-repo_1.0_all.deb
rm discord-repo_1.0_all.deb
sudo apt update
sudo apt -y install discord-canary
if echo $XDG_CURRENT_DESKTOP | grep -i unity > /dev/null; then
  sudo sed -i '/Exec=/ s/Exec=/Exec=env XDG_CURRENT_DESKTOP=kde /' /usr/share/applications/discord-canary.desktop
  sudo update-desktop-database
fi
