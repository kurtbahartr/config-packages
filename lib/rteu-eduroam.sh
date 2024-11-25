#!/bin/sh

# RTEU eduroam: Fix CAT for RTEU and run it
# This script exists here to fix eduroamCAT for the students of Recep
# Tayyip Erdogan University.
#
# Usage: /path/to/rteu-eduroam.sh

curl -fsSL "https://cat.eduroam.org/user/API.php?action=downloadInstaller&lang=en&profile=6372&device=linux&generatedfor=user&openroaming=0" > rteu-eduroam.py
curl -fsSL https://github.com/kurtbahartr/config-packages/raw/master/patches/rteu-eduroam.patch | patch -p1
