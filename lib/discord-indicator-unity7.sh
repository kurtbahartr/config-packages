#!/bin/bash

# Discord client fixup for Unity7
#
# This is basically a remedy to the missing indicator.
# Must be run every time the client is updated.

if echo $XDG_CURRENT_DESKTOP | grep -i unity > /dev/null; then
  sudo sed -i '/Exec=/ s/Exec=/Exec=env XDG_CURRENT_DESKTOP=kde /' /usr/share/applications/discord*.desktop
  sudo update-desktop-database
fi
