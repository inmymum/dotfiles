mkdir /home/$USER/apps
mkdir /home/$USER/apps/thorium
sudo mkdir /etc/sddm.conf.d/
rm /home/$USER/.config/hypr/hyprland.conf
echo "Downloading apps"
echo "  Downloading packages"
sudo pacman -S --noconfirm hyprlock hypridle unzip tlp
echo "  Installed packages"
echo "  Downloading browser (thorium)"
wget -q https://github.com/$(curl -s https://github.com/Alex313031/Thorium/releases|grep '<a href="/Alex313031/thorium/releases'|grep SSE3.zip|awk '{print substr($0,18,93)}') -P /home/$USER/apps/thorium
unzip -qq $(ls /home/$USER/apps/thorium/) -d /home/$USER/apps/thorium
echo "  Installed browser into /home/$USER/apps/thorium/"
echo "Setting up configuration files"
echo "  hyprland"
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hyprland.conf | tee /home/$USER/.config/hypr/hyprland.conf > /dev/null
echo "  hypridle"
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hypridle.conf | tee /home/$USER/.config/hypr/hypridle.conf > /dev/null
echo "  hyprlock"
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hyprlock.conf | tee /home/$USER/.config/hypr/hyprlock.conf > /dev/null
echo "  tlp"
sudo systemctl enable tlp
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/tlp.conf | sudo tee /etc/tlp.conf > /dev/null 
echo "  bootloader"
sudo sed -i "/options/s/$/ silent/" /boot/loader/entries/$(ls /boot/loader/entries/|grep -v fallback)
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/boot/loader/loader.conf | sudo tee /boot/loader/loader.conf > /dev/null
echo "  autologin"
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/sddm.conf.d/autologin.conf | sudo tee /etc/sddm.conf.d/autologin.conf > /dev/null
echo "Installation complete"
reboot
