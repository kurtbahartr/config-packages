#!/bin/sh

# Snapshot date and time: November 11, 2024, 2:40 PM, UTC+03
# Snapshot taken on: Windows Subsystem for Linux, version 2
#                    Host: Casper Excalibur G770.1245

# Specs of the subsystem the snapshot was taken on:
# Intel Core i5-12450H / Core layout: 8C12T
# 16 GB (allocated from a total 32 GB) 3200 MHz DDR4 SODIMM
# 1 TB VHD on 2 TB Crucial P3 (NVMe SSD)

# Update and upgrade
sudo apt update
sudo apt upgrade
sudo snap refresh

# Remove "Install RELEASE", also known as Ubuntu Desktop Installer
sudo snap remove ubuntu-desktop-installer

# Some common CLI tools not shipped with WSL by default
sudo apt -y install wslu gh

# HyFetch! - Because why not!!!
sudo apt -y install hyfetch

# Fixup for HyFetch - There has never been a single release since the bug with Ubuntu version was resolved.
sudo wget -O /usr/bin/neowofetch https://github.com/hykilpikonna/hyfetch/raw/master/neofetch
