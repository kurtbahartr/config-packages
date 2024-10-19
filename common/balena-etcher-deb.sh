#!/bin/sh

# Common script to install balena Etcher from balena.io's GitHub organization.

# balena Etcher
gh release download --pattern 'balena-etcher_*_amd64.deb' -R balena-io/etcher && \
sudo apt -y install ./balena-etcher_*_amd64.deb
rm balena-etcher_*_amd64.deb
