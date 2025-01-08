#!/bin/sh

# Stage No.1: Drivers

# Snapshot date and time: January 8, 2025, 1:05 PM, UTC+03
# Snapshot taken on: Casper Excalibur G770.1245

# Specs of the computer the snapshot was taken on:
# Intel Core i5-12450H with Intel UHD Graphics / Core layout: 8C12T
# 32 GB 3200 MHz DDR4 SODIMM RAM
# 2 TB Crucial P3 (NVMe) + 500 GB KIOXIA EXCERIA-SSD (NVMe)
# Secure boot: Disabled
# TPM revision: 2.0

# Update packages
sudo rpk update -y

# Install NVIDIA driver version 560.
sudo nala install -y nvidia-driver-560

# Ubuntu MATE's in-house applet for managing PRIME from system tray.
#
# The expression used for the "if" statement isn't that fancy.
# It just lists all installed packages starting with "nvidia-driver",
# then makes sure the only string it checks for is the one that has the package name we need (which takes out the "Listing..." phrase from stdout),
# and then strips out the information we don't need (the part after slash, "/", which includes info like the version),
# while also removing the installed packages that have the phrase "-open" in their names for great measure.
# If all of these return a non-empty string, which means we have the non-open-source one, then install mate-optimus.
if [ "$(sudo apt list --installed nvidia-driver* | grep nvidia-driver | sed 's/\/.*//; /-open/d')" != "" ]; then
    sudo nala install -y mate-optimus
fi
