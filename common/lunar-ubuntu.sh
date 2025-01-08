#!/bin/sh

# Common script to patch the Ubuntu-specific script for
# Lunar Shell for client use.
#
# Lunar Shell itself is aimed towards servers and does
# much more than setting up a shell. This patch is made
# to modify it in a way that sanitizes it for client use
# case.
#
# Lunar Shell is developed by Luna (ohemilyy on GitHub).
# Client use-case patch is maintained by Linda St-Denis.

# Lunar-Ubuntu
curl --remote-name -L https://raw.githubusercontent.com/ohemilyy/SysScripts/main/LunarShell/src/distros/ubuntu.sh
patch -p1 < <(https://raw.githubusercontent.com/kurtbahartr/config-packages/master/patches/lunar-ubuntu.patch)
sudo bash ubuntu.sh
rm ubuntu.sh
chsh -s /usr/bin/zsh
echo "Your shell has been changed to ZSH and it has been configured to provide an experience close to Bash."
echo -e "If you don't like this, you can always switch back with the following command:\n"
echo -e "  chsh -s /bin/bash\n"
