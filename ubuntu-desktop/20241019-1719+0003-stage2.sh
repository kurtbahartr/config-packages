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

# Ubuntu Pro - Uncomment only if you are on an LTS release and have an eligible Ubuntu One account.
#sudo pro attach

# Update packages
sudo apt update
sudo apt -y upgrade
sudo snap refresh

# CLI text editors
sudo apt -y install nano vim

# CURL - Doesn't exist on the base install for some reason
sudo apt -y install curl

# Rename - The CLI tool to rename files the *perl* way
sudo apt -y install rename

# HyFetch! - Because why not!!!
sudo apt -y install hyfetch

# Fixup for HyFetch - There has never been a single release since the bug with Ubuntu version was resolved.
sudo wget -O /usr/bin/neowofetch https://github.com/hykilpikonna/hyfetch/raw/master/neofetch

# Linux Wifi Hotspot
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/wihotspot-ppa-deb.sh | bash

# Htop
sudo apt -y install htop

# Python
sudo apt -y install python3 python-is-python3 python3-venv python3-pip

# Tailscale
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/tailscale.sh | sh

# Spotify - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/spotify-deb.sh | sh

# Discord - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/discord-deb.sh | sh

# Mozilla Thunderbird - Snap method
sudo snap install thunderbird

# Google Chrome - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/google-chrome-stable-deb.sh | sh

# Windscribe - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/windscribe-deb.sh | sh

# dconf Editor
sudo apt -y install dconf-editor

# Telegram - Snap method
sudo snap install telegram-desktop

# Git CLI and GitHub CLI - APT method
sudo apt -y install git gh

# Snap Store - Legacy release based on GNOME 41
# The latest release seemingly uses the same design language as subiquity.
# If you don't like the new "App Center", this replacement is for you.
#sudo snap install snap-store --channel=1/stable

# Font Manager - Doesn't play well with the new Nautilus graphically, works better on CLI
sudo apt -y install font-manager

# ibus-mozc - Japanese input by Google for US keyboards!
sudo apt -y install ibus-mozc fonts-noto-cjk-extra

# chntpw - Simple Windows registry editor for Linux, mostly useful for dualboot Bluetooth shenanigans
sudo apt -y install chntpw

# apt-file - Really useful when trying to find a file but don't know what package it belongs to
sudo apt -y install apt-file
sudo apt-file update

# Speedtest CLI - The official Speedtest CLI tool by Ookla
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/speedtest-deb.sh | bash

# progress - Console tool to see the progress of awfully silent commands like "dd".
sudo apt -y install progress

# balena Etcher - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/balena-etcher-deb.sh | sh

# GIMP - APT method
sudo apt -y install gimp

# GNOME Tweaks
sudo apt -y install gnome-tweaks

# Wine - APT method, from Ubuntu repos
sudo apt -y install wine {lib{nss,pam}-,}winbind

# Nautilus add-on for "Send To..." targets
sudo apt -y install nautilus-sendto

# Timeshift - Much like macOS's "Timeshift" except it uses shadow copies instead of filesystem-level snapshots.
sudo apt -y install timeshift

# VirtualBox - APT method, from Ubuntu repos
sudo apt -y install virtualbox{,-{guest-additions-iso,ext-pack}}
