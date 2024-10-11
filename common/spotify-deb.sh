#!/bin/sh

# Common script to install and configure Spotify.

# Spotify
sudo wget -O {,https://github.com/kurtbahartr/config-rootfs/raw/master/common-deb}/etc/apt/sources.list.d/spotify.sources
# TODO: Find a way to determine the latest key on Spotify downloads.
(echo -n "Signed-By:" && curl -sL https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sed 's/^/ /') | sudo tee -a /etc/apt/sources.list.d/spotify.sources > /dev/null
sudo apt update
sudo apt -y install spotify-client
