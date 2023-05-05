#!/bin/bash

# SDDM Login Manager
sudo systemctl disable display-manager && sudo systemctl enable sddm
sudo touch /etc/sddm.conf
sudo cp ~/.wallpapers/National_Park_Nord.png /usr/share/sddm/themes/sugar-candy/
sudo mv /usr/share/sddm/themes/sugar-candy/National_Park_Nord.png /usr/share/sddm/themes/sugar-candy/wall_secondary.png

# Setup lock screen.
# Should this script run every time the screens change?  Yeah.
betterlockscreen -u ~/.wallpapers/National_Park_Nord.png --display 1
betterlockscreen -u ~/.wallpapers/National_Park_Nord.png --blur 0.5 --display 1

chmod +x ~/.config/picom/scripts/toggle-picom-inactive-opacity.sh
chmod +x ~/.config/polybar.personal/scripts/check-read-mode-status.sh
