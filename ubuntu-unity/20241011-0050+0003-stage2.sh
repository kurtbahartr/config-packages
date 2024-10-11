#!/bin/sh

# Stage No.2: Packages

# Snapshot date and time: October 11, 2024, 12:50 AM, UTC+03
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

# Engrampa - MATE's fork of GNOME File Roller
# GNOME File Roller is built on libadwaita, which means you're going to have some breakages with it on Unity.
# ubuntu-unity-desktop and nemo-fileroller depend on GNOME File Roller, so we're going to keep it.
sudo apt -y install engrampa 7zip-standalone 7zip-rar rar

# Linux Wifi Hotspot
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/wihotspot-apt.sh | sh

# Htop
sudo apt -y install htop

# Python
sudo apt -y install python3 python-is-python3 python3-venv python3-pip

# Tailscale
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/tailscale.sh | sh

# Spotify - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/spotify-apt.sh | sh

# Discord - APT method
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/common/discord-apt-repo.sh | sh

# WhatSie - WhatsApp Web client based on Qt WebEngine with a wide array of features - Snap method
sudo snap install whatsie

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

# Snap Store - Legacy release based on GNOME 41
# The latest release seemingly uses the same design language as subiquity, which causes inconsistencies on GTK-based DEs outside of GNOME itself.
# GNOME Software also causes its own set of inconsistencies, such as having the regular "Software" branding instead of "Ubuntu Software".
sudo snap install snap-store --channel=1/stable

# Font Manager
sudo apt -y install font-manager nemo-font-manager

# ibus-mozc - Japanese input by Google for US keyboards!
sudo apt -y install ibus-mozc fonts-noto-cjk-extra

# chntpw - Simple Windows registry editor for Linux, mostly useful for dualboot Bluetooth shenanigans
sudo apt -y install chntpw

# apt-file - Really useful when trying to find a file but don't know what package it belongs to
sudo apt -y install apt-file
sudo apt-file update
