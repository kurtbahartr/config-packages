#!/bin/bash

# Zapret-Git: Clones and installs Zapret from its Git repo.
#
# You may want to git-diff the config with the defaults just in case:
#
#   git diff --no-index /opt/zapret/config{,.default}
#
# Usage: /path/to/zapret-git.sh

cd /tmp
curl -sL https://github.com/bol-van/zapret/archive/master.tar.gz | tar -xvz
cd zapret-master
echo "Just perform the installation. The config will be replaced with our own in the end."
./install_easy.sh
curl -s https://raw.githubusercontent.com/kurtbahartr/config-rootfs/master/common/opt/zapret/config | sudo tee /opt/zapret/config
sudo systemctl daemon-reload
sudo systemctl reload zapret
sudo systemctl restart zapret
