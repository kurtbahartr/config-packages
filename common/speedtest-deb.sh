#!/bin/sh

# Common script to install and configure Speedtest CLI by Ookla.

# Speedtest CLI by Ookla
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
# The script assumes the package is available for the distro version detected.
# Codename matches for Ubuntu;
# jammy: 22.04 LTS "Jammy Jellyfish"
# kinetic: 22.10 "Kinetic Kudu"
# lunar: 23.04 "Lunar Lobster"
# mantic: 23.10 "Mantic Minotaur"
# noble: 24.04 LTS "Noble Numbat"
# oracular: 24.10 "Oracular Oriole"
# p?: 25.04 "P. P." - TBA&TBD
sudo sed -i '/ubuntu/ s/kinetic\|lunar\|mantic\|noble\|oracular/jammy/' /etc/apt/sources.list.d/ookla_speedtest-cli.list
sudo apt update
sudo apt install speedtest
