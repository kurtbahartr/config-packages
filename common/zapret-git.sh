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
# This answers all questions with default answers. We'll replace the config with our own anyway so it doesn't matter.
while true; do echo ""; done | ./install_easy.sh
curl -s https://raw.githubusercontent.com/kurtbahartr/config-rootfs/common/opt/zapret/config | sudo tee /opt/zapret/config
sudo systemctl reload zapret
sudo systemctl restart zapret
