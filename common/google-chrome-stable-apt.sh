#!/bin/sh

# Common script to install Google Chrome from Google's own website.

# Google Chrome (Stable Release)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
