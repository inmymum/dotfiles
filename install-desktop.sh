sudo pacman -S --noconfirm unzip > /dev/null
rm /home/$USER/.config/hypr/hyprland.conf
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/desktop/hyprland.conf | tee /home/$USER/.config/hypr/hyprland.conf > /dev/null
mkdir /home/$USER/apps
mkdir /home/$USER/apps/thorium
wget -q https://github.com/$(curl -s https://github.com/Alex313031/Thorium/releases|grep '<a href="/Alex313031/thorium/releases'|grep SSE3.zip|awk '{print substr($0,18,93)}') -P /home/$USER/apps/thorium
unzip -qq /home/$USER/apps/thorium/$(ls /home/$USER/apps/thorium/) -d /home/$USER/apps/thorium/
rm /home/$USER/apps/thorium/*.zip
sudo sed -i "/options/s/$/ quiet/" /boot/loader/entries/$(ls /boot/loader/entries/|grep -v fallback)
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/boot/loader/loader.conf | sudo tee /boot/loader/loader.conf > /dev/null
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/systemd/logind.conf | sudo tee /etc/systemd/logind.conf > /dev/null
mkdir /home/$USER/.config/procps
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/procps/toprc | tee /home/$USER/.config/procps/toprc > /dev/null
mkdir /home/$USER/.config/wofi
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/wofi/style.css | tee /home/$USER/.config/wofi/style.css > /dev/null 
mkdir /home/$USER/.config/scripts
curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/scripts/power.sh | tee /home/$USER/.config/scripts/power.sh > /dev/null 
sudo chmod +x /home/$USER/.config/scripts/power.sh
