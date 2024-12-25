#!/bin/bash

# Snapshot date and time: December 1, 2024, 11:33 AM, UTC+03
# Snapshot taken on: Casper Excalibur G770.1245

# Specs of the computer the snapshot was taken on:
# Intel Core i5-12450H with Intel UHD Graphics / Core layout: 8C12T
# 32 GB 3200 MHz DDR4 SODIMM RAM
# 2 TB Crucial P3 (NVMe) + 500 GB KIOXIA EXCERIA-SSD (NVMe)
# Secure boot: Enabled
# TPM revision: 2.0

# See the following link for more info about how to set up secure boot
# with shim-signed:
#   https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot#shim

# Usage: /path/to/rolling.sh [novideo|nvidia]
# The supplementary parameter is passed to diana-dotfiles.sh as is. See there for more info.

# Root safeguard. AUR packages explicitly require non-root accounts.
groups | grep "root" > /dev/null
if groups | grep -q "root"; then
    echo "You're running as root. Running as root is dangerous and might break your system."
    echo "Furthermore, AUR packages explicitly require non-root but sudo users to build and install."
    echo "Create a user account, then try again."
    exit 1
fi

# Sudoer detection
if [[ $(sudo --list 2>&1 | grep "(ALL : ALL) ALL") == "" ]]; then
    # Detect if our pending sudoer file exists.
    if [ -f "$HOME"/.slc-pending-sudoer ]; then
        echo "You were added as a sudoer but the change wasn't reflected."
        echo "Please reboot or use the following command, then come back:"
        echo "newgrp $USER"
        exit 1
    fi
    # Compose the commands to run with su as root
    function su_cmds() {
        # Install sudo if necessary
        if [ "$(command -v sudo)" == "" ]; then
            echo "sudo doesn't exist. Installing..." 1>&2
            echo "pacman -Sy sudo"
        fi
        # Configure sudo for wheel group and add the user to the wheel group.
        echo "sed -i '/^#%wheel ALL=(ALL:ALL) ALL$/ s/#//'"
        echo "usermod -aG wheel $USER"
    }
    echo "You'll be prompted for the **root** password."
    echo "This is required only once, and you'll need to use your own password after then."
    echo "What I'm trying to do here is to set up sudo for you so you can use the command,"
    echo "which is one of the base requirements for this script."
    su -c "$(su_cmds)"
    if [ "$?" != "0" ]; then
        echo "Well, that didn't seem to work as I expected. Perhaps you entered the password incorrectly?"
        echo "In any case, it looks like you need to do this change yourself somehow."
        echo "See the Arch Wiki for instructions on this."
        exit 1
    fi
    echo "So this part is done."
    echo "All you need to do now is to make sure this change is reflected."
    echo "How you do this is up to you, but my recommendation is to use the newgrp command:"
    echo "newgrp $USER"
    touch ~/.slc-pending-sudoer
fi

# We're going just fine, so let's remove the pending sudoer file if it exists.
if [ -f "$HOME/.slc-pending-sudoer" ]; then
    rm ~/.slc-pending-sudoer
fi

# Diana's dotfiles - The fastest and easiest way to get going!
bash <(curl -s https://raw.githubusercontent.com/kurtbahartr/config-packages/master/lib/diana-dotfiles.sh) "$1"
