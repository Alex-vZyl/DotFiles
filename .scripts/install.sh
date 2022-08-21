#!/bin/bash

# Make the function keys on the keyboard default.
# (This is currently specific to my keychron keyboard)
FILE=/etc/modprobe.d/hid_apple.conf
sudo touch $FILE
sudo sh -c "echo 'options hid_apple fnmode=2' >> $FILE"

# Use yay to get pamac (installed by default on EndeavourOS).
# yay -S libpamac-aur pamac-all # The full version is not currently building.
yay -S libpamac-aur pamac-aur

# Browser.
# Keep firefox since some programs use it by default.
# (for example cargo)
sudo pamac install firefox brave-bin --no-confirm

# Office.
sudo pamac install onlyoffice-bin xournalpp --no-confirm

# Some aesthetic stuff.
sudo pamac install cmatrix bonsai.sh-git pipes.sh lolcat shell-color-scripts --no-confirm

# Fonts.  This is very large, maybe use smaller package.
sudo pamac install nerd-fonts-complete --no-confirm

# Utilities.
sudo pamac install btop nvtop lazygit flameshot brightnessctl pfetch bottom --no-confirm

# Icons.
sudo pamac install papirus-icon-theme --no-confirm

# Bootloader.
sudo pamac install refind --no-confirm
refind-install

# Login manager.
sudo pamac install ly --no-confirm
sudo systemctl disable gdm.service # Not sure how to check which ons is installed. 
sudo systemctl enable ly.service
sudo systemctl start ly.service

# Required for Gnome extensions.
sudo pamac install gnome-browser-connector --no-confirm

# Enable BT on startup.
sudo sed 's/#AutoEnable=false/AutoEnable=true/g' /etc/bluetooth/main.conf

# Terminal.
sudo pamac install alacritty --no-confirm

# Coding stuff.
sudo pamac install neovim neovide xclip --no-confirm
# Install plugin for nvim.
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo pamac install github-desktop github-cli code --no-confirm

# Communication.
sudo pamac install whatsapp-nativefier discord signal-desktop --no-confirm

# i3 stuff.
sudo pamac install feh cronie rofi-greenclip picom-pijulius-git polybar --no-confirm

# Programming languages.
sudo pamac install julia-bin --no-confirm
sudo pamac install cmake --no-confirm

# Setup optimus manager.
# NB: For Nvidia cards only!
sudo pamac install optimus-manager gdm-prime nvidia-settings nvidia-force-composition-pipeline --no-confirm 
sudo sed 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm/custom.conf
sudo touch /etc/optimus-manager/optimus-manager.conf 
sudo sh -c "echo '[optimus]' > /etc/optimus-manager/optimus-manager.conf" 
sudo sh -c "echo 'startup_mode=hybrid' > /etc/optimus-manager/optimus-manager.conf" 
nvidia-force-composition-pipeline

# For some reason EndeavourOS comes with a bunch of terminals...
sudo pamac remove endeavouros-xfce4-terminal-colors xfce4-terminal xterm --no-confirm

# Setup fish (shell).
sudo pamac install fish --no-confirm
fish <<'END_FISH'
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
	fisher install IlanCosman/tide@v5t
END_FISH
