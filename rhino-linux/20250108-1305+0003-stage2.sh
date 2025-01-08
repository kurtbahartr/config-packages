#!/bin/bash

# Stage No.2: Packages

# Snapshot date and time: January 8, 2025, 1:05 PM, UTC+03
# Snapshot taken on: Casper Excalibur G770.1245

# Specs of the computer the snapshot was taken on:
# Intel Core i5-12450H with Intel UHD Graphics / Core layout: 8C12T
# 32 GB 3200 MHz DDR4 SODIMM RAM
# 2 TB Crucial P3 (NVMe) + 500 GB KIOXIA EXCERIA-SSD (NVMe)
# Secure boot: Disabled
# TPM revision: 2.0

# Free the system from unnecessary Snaps!
for i in firefox thunderbird; do
  sudo snap remove ${i}
  sudo pacstall -I -P ${i}-bin
done

# Update packages
sudo rpk update -y

# CLI text editors
sudo nala install -y nano vim
sudo pacstall -I -P helix

# CURL - Doesn't exist on the base install for some reason
sudo nala install -y curl

# Rename - The CLI tool to rename files the *perl* way
sudo nala install -y rename

# HyFetch! - Because why not!!!
sudo nala install -y hyfetch

# Fixup for HyFetch - Their version of Neofetch doesn't acknowledge Rhino Linux.
sudo curl -o /usr/bin/neowofetch https://raw.githubusercontent.com/kurtbahartr/hyfetch/master/neofetch

# Linux Wifi Hotspot
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/wihotspot-ppa-deb.sh)

# Htop
sudo nala install -y htop

# Python
sudo nala install -y python3 python-is-python3 python3-venv python3-pip

# Google Chrome - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/google-chrome-stable-deb.sh)

# Visual Studio Code - Pacstall method
sudo pacstall -I -P vscode-deb

# Tailscale
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/tailscale.sh)

# Spotify - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/spotify-deb.sh)

# Electron configuration for Wayland
bash <(curl -s https://raw.githubusercontent.com/kurtbhaartr/config-packages/master/common/electron-env.sh)

# Discord - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/discord-deb.sh)

# Windscribe - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/windscribe-deb.sh)

# dconf Editor
sudo nala install -y dconf-editor

# Telegram - Pacstall method
sudo pacstall -I -p telegram-bin

# Git CLI and GitHub CLI - APT method
sudo nala install -y git gh

# Font Manager - Doesn't play well with the new Nautilus graphically, works better on CLI
sudo nala install -y font-manager

# fcitx5-mozc - Japanese input by Google for US keyboards!
sudo nala install -y fcitx5-mozc fonts-noto-cjk-extra

# chntpw - Simple Windows registry editor for Linux, mostly useful for dualboot Bluetooth shenanigans
sudo nala install -y chntpw

# apt-file - Really useful when trying to find a file but don't know what package it belongs to
sudo nala install -y apt-file
sudo apt-file update

# Speedtest CLI - The official Speedtest CLI tool by Ookla
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/speedtest-deb.sh)

# progress - Console tool to see the progress of awfully silent commands like "dd".
sudo nala install -y progress

# balena Etcher - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/balena-etcher-deb.sh)

# GIMP - APT method
sudo nala install -y gimp

# Wine - APT method, from Ubuntu repos
sudo nala install -y wine {lib{nss,pam}-,}winbind
sudo ln -sf /usr/share/doc/wine/examples/wine.desktop /usr/share/applications/

# Nautilus add-on for "Send To..." targets
sudo nala install -y nautilus-sendto

# Timeshift - Much like macOS's "Timeshift" except it uses shadow copies instead of filesystem-level snapshots.
sudo nala install -y timeshift

# VirtualBox - APT method, from Ubuntu repos
sudo nala install -y virtualbox{,-{guest-additions-iso,ext-pack}}
sudo usermod -aG vboxusers $USER

# Enroll MOK for DKMS
echo "About to enroll MOK. Please use something simple since you'll have to use it once after reboot."
echo "The easiest you can roll with is 12345678. Just swipe across 1 through 8 on top row."
sudo mokutil --import /var/lib/shim-signed/mok/MOK.der

# Canadian Shield "private" configuration for systemd-resolved
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-rootfs/master/helper-scripts/priv-ca-shield-sysd.sh)

# Zapret - Git repo method
sudo nala install -y libcap-dev libnetfilter-queue-dev
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/zapret-git.sh)

# AppImageLauncher- APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/appimagelauncher-deb.sh)

# Project Ascension launcher - Uses AIL to install it system-wide.
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/projectascension-deb.sh)

# MarkText - Pacstall method
sudo pacstall -I -P marktext-deb

# OBS Studio - APT method
sudo nala install -y obs-studio

# WoeUSB-NG - Python method
# I know you all will hate on me for using --break-system-packages, but I've found no issues about it with this specific package so far.
sudo nala install -y git p7zip-full python3-pip python3-wxgtk4.0 grub2-common grub-pc-bin parted dosfstools ntfs-3g libgtk-3-dev
sudo pip install woeusb-ng --break-system-packages

# Lunar Shell - One-of-a-kind shell that's my new favorite!
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/lunar-ubuntu.sh)

# Gamemode - Gaming on Linux executed properly
sudo nala install -y gamemode

# Powershell 7 - The cross-platform Powershell by Microsoft themselves
curl --remote-name -L https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb
sudo nala install -y ./packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo nala install -y powershell
