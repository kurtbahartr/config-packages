#!/bin/bash

# Stage No.2: Packages

# Snapshot date and time: October 19, 2024, 5:19 PM, UTC+03
# Snapshot taken on: Casper Excalibur G770.1245

# Specs of the computer the snapshot was taken on:
# Intel Core i5-12450H with Intel UHD Graphics / Core layout: 8C12T
# 16 GB 3200 MHz DDR4 SODIMM RAM
# 2 TB Crucial P3 (NVMe) + 500 GB KIOXIA EXCERIA-SSD (NVMe)
# Secure boot: Enabled
# TPM revision: 2.0

# Update packages
sudo rpk -y update

# CLI text editors
sudo nala -y install nano vim
sudo snap install helix --classic

# CURL - Doesn't exist on the base install for some reason
sudo nala -y install curl

# Rename - The CLI tool to rename files the *perl* way
sudo nala -y install rename

# HyFetch! - Because why not!!!
sudo nala -y install hyfetch

# Fixup for HyFetch - Their version of Neofetch doesn't acknowledge Rhino Linux.
sudo curl -o /usr/bin/neowofetch https://raw.githubusercontent.com/kurtbahartr/hyfetch/master/neofetch

# Linux Wifi Hotspot
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/wihotspot-ppa-deb.sh)

# Htop
sudo nala -y install htop

# Python
sudo nala -y install python3 python-is-python3 python3-venv python3-pip

# Google Chrome - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/google-chrome-stable-deb.sh)

# Visual Studio Code - Snap method
sudo snap install code --classic

# Tailscale
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/tailscale.sh)

# Hand off the control of Tailscale CLI to the user
# For Tailscale QS GNOME Extension
sudo tailscale set --operator=$USER

# Spotify - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/spotify-deb.sh)

# Electron configuration for Wayland
bash <(curl -s https://raw.githubusercontent.com/kurtbhaartr/config-packages/master/common/electron-env.sh)

# Discord - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/discord-deb.sh)

# Mozilla Thunderbird - Snap method
sudo snap install thunderbird

# Windscribe - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/windscribe-deb.sh)

# dconf Editor
sudo nala -y install dconf-editor

# Telegram - Snap method
sudo snap install telegram-desktop

# Git CLI and GitHub CLI - APT method
sudo nala -y install git gh

# Snap Store - Legacy release based on GNOME 41
# The latest release seemingly uses the same design language as subiquity.
# If you don't like the new "App Center", this replacement is for you.
#sudo snap install snap-store --channel=1/stable

# Font Manager - Doesn't play well with the new Nautilus graphically, works better on CLI
sudo nala -y install font-manager

# ibus-mozc - Japanese input by Google for US keyboards!
sudo nala -y install ibus-mozc fonts-noto-cjk-extra

# chntpw - Simple Windows registry editor for Linux, mostly useful for dualboot Bluetooth shenanigans
sudo nala -y install chntpw

# apt-file - Really useful when trying to find a file but don't know what package it belongs to
sudo nala -y install apt-file
sudo apt-file update

# Speedtest CLI - The official Speedtest CLI tool by Ookla
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/speedtest-deb.sh)

# progress - Console tool to see the progress of awfully silent commands like "dd".
sudo nala -y install progress

# balena Etcher - APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/balena-etcher-deb.sh)

# GIMP - APT method
sudo nala -y install gimp

# GNOME Tweaks
sudo nala -y install gnome-tweaks

# Wine - APT method, from Ubuntu repos
sudo nala -y install wine {lib{nss,pam}-,}winbind
sudo ln -sf /usr/share/doc/wine/examples/wine.desktop /usr/share/applications/

# Nautilus add-on for "Send To..." targets
sudo nala -y install nautilus-sendto

# Timeshift - Much like macOS's "Timeshift" except it uses shadow copies instead of filesystem-level snapshots.
sudo nala -y install timeshift

# VirtualBox - APT method, from Ubuntu repos
sudo nala -y install virtualbox{,-{guest-additions-iso,ext-pack}}

# Enroll MOK for DKMS
echo "About to enroll MOK. Please use something simple since you'll have to use it once after reboot."
echo "The easiest you can roll with is 12345678. Just swipe across 1 through 8 on top row."
sudo mokutil --import /var/lib/shim-signed/mok/MOK.der

# Canadian Shield "private" configuration for systemd-resolved
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-rootfs/master/helper-scripts/priv-ca-shield-sysd.sh)

# Zapret - Git repo method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/zapret-git.sh)

# AppImageLauncher- APT method
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/appimagelauncher-deb.sh)

# Project Ascension launcher - Uses AIL to install it system-wide.
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/projectascension-deb.sh)

# MarkText - Snap method
sudo snap install marktext

# GDM Settings - Theme changes are necessary to completement Rhino's look in GDM
sudo nala install -y gdm-settings

# OBS Studio - APT method
sudo nala install -y obs-studio

# WoeUSB-NG - Python method
# I know you all will hate on me for using --break-system-packages, but I've found no issues about it with this specific package so far.
sudo nala install -y git p7zip-full python3-pip python3-wxgtk4.0 grub2-common grub-pc-bin parted dosfstools ntfs-3g libgtk-3-dev
sudo pip install woeusb-ng --break-system-packages

# All the GNOME bloat
sudo nala install -y gnome

# Lunar Shell - One-of-a-kind shell that's my new favorite!
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/lunar-ubuntu.sh)
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/lunar-zshrc.sh)
chsh -s /usr/bin/zsh
