#!/bin/bash

# Hack network-manager-applet autostart entry to launch with --no-agent
# flag.
#
# This flag disables notifications but has a side effect on i3wm.

sudo sed -i '/Exec/ s/$/ --no-agent/' /usr/share/applications/nm-applet.desktop
