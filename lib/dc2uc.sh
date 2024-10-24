#!/bin/sh

# DC2UC: Debian Codename (2)to Ubuntu Codename
# This script exists here to convert the codename for any given non-EOS
# Debian version to that of Ubuntu's. Ubuntu usually bases their distro
# on Debian's latest testing release, which means we can easily do the
# matching with the corresponding Ubuntu LTS releases.
#
# Usage: source /path/to/dc2uc.sh debian_codename

case "$1" in
    "")
        echo "Usage: source /path/to/uc2dc.sh debian_codename" > /dev/stderr
        return 1
        ;;
    bullseye*)
        echo "focal"
        ;;
    bookworm*)
        echo "jammy"
        ;;
    trixie*)
        echo "noble"
        ;;
    *)
        echo "You're using a Debian version/derivative that is EOS or doesn't have a corresponding Ubuntu release. Therefore, it's not guaranteed that you'll get the full set of packages from this snapshot." > /dev/stderr
        return 1
        ;;
esac
return 0
