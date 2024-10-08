#!/bin/sh

# Stage No.2: Packages

# Snapshot date and time: October 8, 2024, 3:38 PM, UTC+03
# Snapshot taken on: Casper Excalibur G770.1245

# Specs of the computer the snapshot was taken on:
# Intel Core i5-12450H with Intel UHD Graphics / Core layout: 8C12T
# 16 GB 3200 MHz DDR4 SODIMM RAM
# 2 TB Crucial P3 (NVMe) + 500 GB KIOXIA EXCERIA-SSD (NVMe)
# Secure boot: Enabled
# TPM revision: 2.0

# Ubuntu Pro - Uncomment only if you are on an LTS release and have an eligible Ubuntu One account.
#sudo pro attach

# Update packages
sudo apt update
sudo apt -y upgrade
sudo snap refresh

# Tailscale
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/tailscale.sh | sh

# Spotify - Snap method
sudo snap install spotify

# Discord - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/discord-apt-repo.sh | sh

# Mozilla Thunderbird - Snap method
sudo snap install thunderbird

# Google Chrome - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/google-chrome-stable-apt.sh | sh

# Windscribe - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/windscribe-apt.sh | sh

# dconf Editor
sudo apt -y install dconf-editor

# Telegram - Snap method
sudo snap install telegram-desktop

# Git CLI and GitHub CLI - APT method
sudo apt -y install git gh
