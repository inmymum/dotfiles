#!/bin/bash
mkdir /home/$USER/apps
mkdir /home/$USER/apps/thorium
sudo mkdir /etc/sddm.conf.d/
rm /home/$USER/.config/hypr/hyprland.conf
echo "Downloading apps"
echo "  Downloading browser (thorium)"
wget -q https://github.com/$(curl -s https://github.com/Alex313031/Thorium/releases|grep '<a href="/Alex313031/thorium/releases'|grep SSE3.zip|awk '{print substr($0,18,93)}') -P /home/$USER/apps/thorium
unzip -qq $(ls /home/$USER/apps/thorium/) -d /home/$USER/apps/thorium
echo "  Installed browser into /home/$USER/apps/thorium/"
echo "  Downloading packages"
sudo pacman -S --noconfirm hyprlock unzip
echo "  Installed packages"
echo "Setting up configuration files"
echo "  hyprland"
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hyprland.conf | tee /home/$USER/.config/hypr/hyprland.conf
echo "  hyprlock"
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hyprlock.conf | tee /home/$USER/.config/hypr/hyprlock.conf
echo "  autologin"
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/sddm.conf.d/autologin.conf | sudo tee /etc/sddm.conf.d/autologin.conf
echo "Installation complete"
