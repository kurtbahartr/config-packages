#!/bin/sh

# Stage No.1: Drivers

# Snapshot date and time: February 10, 2025, 7:08 PM, UTC+03
# Snapshot taken on: Casper Excalibur G770.1245

# Specs of the computer the snapshot was taken on:
# Intel Core i5-12450H with Intel UHD Graphics / Core layout: 8C12T
# 32 GB 3200 MHz DDR4 SODIMM RAM
# 2 TB Crucial P3 (NVMe) + 500 GB KIOXIA EXCERIA-SSD (NVMe)
# Secure boot: Enabled
# TPM revision: 2.0

# Update packages
sudo apt update
sudo apt upgrade -y
sudo snap refresh

# Install NVIDIA driver version 550. Ubuntu 24.04.
sudo apt install -y nvidia-driver-550

# Ubuntu MATE's in-house applet for managing PRIME from system tray.
#
# The expression used for the "if" statement isn't that fancy.
# It just lists all installed packages starting with "nvidia-driver",
# then makes sure the only string it checks for is the one that has the package name we need (which takes out the "Listing..." phrase from stdout),
# and then strips out the information we don't need (the part after slash, "/", which includes info like the version),
# while also removing the installed packages that have the phrase "-open" in their names for great measure.
# If all of these return a non-empty string, which means we have the non-open-source one, then install mate-optimus.
if [ "$(sudo apt list --installed nvidia-driver* | grep nvidia-driver | sed 's/\/.*//; /-open/d')" != "" ]; then
    sudo apt install -y mate-optimus
fi

# X.Org Synaptics driver - For proper touchpad settings
sudo apt install -y xserver-xorg-input-synaptics

# Nuke AppArmor for Electron
sudo systemctl disable apparmor --now
sudo echo 'GRUB_DEFAULT_LINUX+="apparmor=0"' >> /etc/default/grub.d/disable-apparmor
sudo update-grub

# Reboot
echo "Significant changes were done to require reboot. Rebooting in 5..."
sleep 5
reboot
