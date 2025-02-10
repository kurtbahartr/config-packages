#!/bin/bash

# Downloads and installs GTK3 version of GNOME File Roller.

# File Roller GTK3
curl --remote-name https://archive.ubuntu.com/ubuntu/pool/main/n/nautilus/libnautilus-extension1a_3.36.1.1-1ubuntu2_amd64.deb
curl --remote-name https://archive.ubuntu.com/ubuntu.pool/main/f/file-roller/file-roller_3.42.0-1_amd64.deb
sudo apt install -y ./{libnautilus-extension1a_3.36.1.1-1ubuntu2,file-roller_3.42.0-1}_amd64.deb
for i in libnautilus-extension1a file-roller; do
  sudo apt-mark hold $i
done
rm {libnautilus-extension1a_3.36.1.1-1ubuntu2,file-roller_3.42.0-1}_amd64.deb
