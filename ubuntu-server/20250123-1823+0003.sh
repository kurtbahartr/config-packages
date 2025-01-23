#!/bin/bash

# Snapshot date and time: January 23, 2025, 6:23 PM, UTC+03
# Snapshot taken on: HP 15-rb004nt

# Specs of the computer the snapshot was taken on:
# AMD A4-9120 with Radeon R3 Graphics / Core layout: 2C2T2G
# 16 GB 1067 MHz DDR4 SODIMM RAM
# 480 GB KIOXIA EXCERIA-SSD (SATA)
# Secure boot: Enabled
# TPM revision: 2.0

# Update packages
sudo apt update && sudo apt upgrade -y
sudo snap refresh

# CLI text editors
sudo apt install -y nano vim

# Pacstall - AUR for Ubuntu
sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install)"

# Helix
sudo pacstall -I -P helix

# CURL - Doesn't exist on the base install for some reason
sudo apt install -y curl

# Rename - The CLI tool to rename files the *perl* way
sudo apt install -y rename

# HyFetch! - Because why not!!!
sudo apt install -y hyfetch

# FastFetch - Neofetch, but _faster_.
sudo pacstall -I fastfetch-git

# Htop
sudo apt install -y htop

# Python
sudo apt install -y python3 python-is-python3 python3-venv python3-pip

# Git CLI and GitHub CLI - APT method
sudo apt install -y git gh

# apt-file - Really useful when trying to find a file but don't know what package it belongs to
sudo apt install -y apt-file
sudo apt-file update

# Speedtest CLI - The official Speedtest CLI tool by Ookla
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/speedtest-deb.sh)

# progress - Console tool to see the progress of awfully silent commands like "dd".
sudo apt install -y progress

# Enroll MOK for DKMS
echo "About to enroll MOK. Please use something simple since you'll have to use it once after reboot."
echo "The easiest you can roll with is 12345678. Just swipe across 1 through 8 on top row."
sudo mokutil --import /var/lib/shim-signed/mok/MOK.der

# Canadian Shield "private" configuration for systemd-resolved
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-rootfs/master/helper-scripts/priv-ca-shield-sysd.sh)

# Zapret - Git repo method
sudo apt install -y libcap-dev libnetfilter-queue-dev
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/zapret-git.sh)

# WoeUSB-NG - Python method
# I know you all will hate on me for using --break-system-packages, but I've found no issues about it with this specific package so far.
sudo apt install -y git p7zip-full python3-pip python3-wxgtk4.0 grub2-common grub-pc-bin parted dosfstools ntfs-3g libgtk-3-dev
sudo pip install woeusb-ng --break-system-packages

# Lunar Shell - One-of-a-kind shell that's my new favorite!
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/common/lunar-ubuntu.sh)

# Powershell 7 - The cross-platform Powershell by Microsoft themselves
curl --remote-name -L https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb
sudo apt install -y ./packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt install -y powershell
