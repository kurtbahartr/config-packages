#!/bin/sh

# Stage No.1: Drivers

# Snapshot date and time: October 23, 2024, 8:42 PM, UTC+03
# Snapshot taken on: Casper Excalibur G770.1245

# Specs of the computer the snapshot was taken on:
# Intel Core i5-12450H with Intel UHD Graphics / Core layout: 8C12T
# 16 GB 3200 MHz DDR4 SODIMM RAM
# 2 TB Crucial P3 (NVMe) + 500 GB KIOXIA EXCERIA-SSD (NVMe)
# Secure boot: Enabled
# TPM revision: 2.0

# Detect if we're running with a user that's a part of the sudo group or as root.
groups | grep "sudo\|root" > /dev/null
if [ "$?" != "0" ]; then
    # Detect if our pending sudoer file exists.
    if [ ! -z "~/.slc-pending-sudoer" ]; then
        echo "You were added as a sudoer but the change wasn't reflected."
        echo "Please reboot or use the following command, then come back:"
        echo "newgrp $USER"
        exit 1
    fi
    # Add the user to the sudo group.
    echo "You'll be prompted for the **root** password."
    echo "This is required only once, and you'll need to use your own password after then."
    echo "What I'm trying to do here is to add you to the sudo group so you can use the sudo command,"
    echo "which is one of the base requirements for this script."
    su -c "/usr/sbin/usermod -aG sudo $USER"
    if [ "$?" != "0" ]; then
        echo "Well, that didn't seem to work as I expected. Perhaps you entered the password incorrectly?"
        echo "In any case, it looks like you need to do this change yourself somehow."
        echo "Here's the command to do it (run it as root):"
        echo "uesrmod -aG sudo $USER"
        exit 1
    fi
    echo "So this part is done."
    echo "All you need to do now is to make sure this change is reflected."
    echo "How you do this is up to you, but my recommendation is to use the newgrp command:"
    echo "newgrp $USER"
    touch ~/.slc-pending-sudoer
fi

# We're going just fine, so let's remove the pending sudoer file if it exists.
if [ ! -z "~/.slc-pending-sudoer" ]; then
    rm ~/.slc-pending-sudoer
fi

# Update packages
sudo apt update
sudo apt -y upgrade

# X.Org input package for LibInput - Uncomment if you are on an Ubuntu version lower than 24.10
#sudo apt -y install xserver-xorg-input-libinput libinput-utils

# X.Org configuration for LibInput - Intended for somewhat modern Synaptics touchpads to enable the settings other DEs provide natively.
#sudo wget -O /etc/X11/xorg.conf.d/30-touchpad.conf https://github.com/kurtbahartr/config-rootfs/raw/master/common/etc/X11/xorg.conf.d/30-touchpad.conf

# Add contrib and non-free repos as needed for NVIDIA.
for i in contrib non-free; do
    sudo add-apt-repository -y $i
done

# Install nvidia-detect and use it to install the appropriate driver.
sudo apt install -y nvidia-detect
sudo apt install -y --install-recommends $(nvidia-detect | grep nvidia) firmware-misc-nonfree switcheroo-control power-profiles-daemon nvidia-suspend-common

# Add the GRUB option to load NVIDIA DRM and update GRUB
echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"' | sudo tee /etc/default/grub.d/nvidia-modeset.cfg
sudo update-grub

# Enable NVIDIA SystemD services for Wayland
for i in suspend hibernate resume; do
    sudo systemctl enable nvidia-$i
done

# Configure NVIDIA driver to preserve VMem allocations
sudo sed -i '/PreserveVideoMemoryAllocations=1/ s/\#//' /etc/modprobe.d/nvidia-options.conf || \
    echo "options nvidia-current NVReg_PreserveVideoMemoryAllocations=1" | sudo tee /etc/modprobe.d/nvidia-options.conf

# Enroll the key with root password
echo "Requesting MOK enrollment for the NVIDIA drivers."
echo "Enter the password you desire to use during this enrollment."
sudo mokutil --import /var/lib/dkms/mok.pub && \
echo "MOK enrollment requested. Please reboot NOW!" && \
echo "You'll be asked to finish the enrollment, followed by the password you just put, and you have only ONE CHANCE to get it right!"
