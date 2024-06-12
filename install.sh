if [[ ! $(echo $options) ]]; then
  sudo pacman -S --noconfirm unzip hypridle hyprlock tlp > /dev/null
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/tlp.conf | sudo tee /etc/tlp.conf > /dev/null 
  sudo systemctl enable tlp > /dev/null
  rm /home/$USER/.config/hypr/hyprland.conf
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hyprland.conf | tee /home/$USER/.config/hypr/hyprland.conf > /dev/null
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hypridle.conf | tee /home/$USER/.config/hypr/hypridle.conf > /dev/null
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hyprlock.conf | tee /home/$USER/.config/hypr/hyprlock.conf > /dev/null
  mkdir /home/$USER/apps
  mkdir /home/$USER/apps/thorium
  wget -q https://github.com/$(curl -s https://github.com/Alex313031/Thorium/releases|grep '<a href="/Alex313031/thorium/releases'|grep SSE3.zip|awk '{print substr($0,18,93)}') -P /home/$USER/apps/thorium
  unzip -qq /home/$USER/apps/thorium/$(ls /home/$USER/apps/thorium/) -d /home/$USER/apps/thorium/
  rm /home/$USER/apps/thorium/*.zip
  sudo mkdir /etc/sddm.conf.d/
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/sddm.conf.d/autologin.conf | sudo tee /etc/sddm.conf.d/autologin.conf > /dev/null
  sudo sed -i "/options/s/$/ quiet/" /boot/loader/entries/$(ls /boot/loader/entries/|grep -v fallback)
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/boot/loader/loader.conf | sudo tee /boot/loader/loader.conf > /dev/null
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/systemd/logind.conf | sudo tee /etc/systemd/logind.conf > /dev/null
  sudo chmod +x /home/$USER/.config/scripts/power.sh
  mkdir /home/$USER/.config/wofi
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/wofi/style.css | sudo tee /home/$USER/.config/wofi/style.css> /dev/null 
  mkdir /home/$USER/.config/scripts
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/scripts/power.sh | sudo tee /home/$USER/.config/scripts/power.sh > /dev/null 
  curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/scripts/brightness.sh | sudo tee /usr/bin/brightness
  sudo chmod +x /usr/bin/brightness
else
  packages=""
  echo "Installing apps and configs"
  if [[ $(echo $options|grep -o hypridle) ]]; then
    packages+="hypridle "
    echo "-> hypridle"
    curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hypridle.conf | tee /home/$USER/.config/hypr/hypridle.conf > /dev/null
  fi
  if [[ $(echo $options|grep -o hyprlock) ]]; then
    packages+="hyprlock "
    echo "-> hyprlock"
    curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hyprlock.conf | tee /home/$USER/.config/hypr/hyprlock.conf > /dev/null  
  fi
  if [[ $(echo $options|grep -o thorium) ]]; then
    mkdir /home/$USER/apps
    mkdir /home/$USER/apps/thorium
    echo "-> thorium (browser)"
    wget -q https://github.com/$(curl -s https://github.com/Alex313031/Thorium/releases|grep '<a href="/Alex313031/thorium/releases'|grep SSE3.zip|awk '{print substr($0,18,93)}') -P /home/$USER/apps/thorium
    unzip -qq $(ls /home/$USER/apps/thorium/) -d /home/$USER/apps/thorium
  fi
  if [[ $(echo $packages|grep -o tlp) ]]; then
    sudo pacman -S --noconfirm tlp > /dev/null
    echo "-> tlp"
    sudo systemctl enable tlp > /dev/null
    curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/tlp.conf | sudo tee /etc/tlp.conf > /dev/null 
  fi
  if [[ $(echo $packages|grep -o pmenu) ]]; then
    echo "-> power-menu"
    curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/scripts/power.sh | sudo tee /home/$USER/.config/scripts/power.sh > /dev/null 
    chmod +x /home/$USER/.config/scripts/power.sh
    curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/wofi/style.css | sudo tee /home/$USER/.config/wofi/style.css> /dev/null 
  fi  
  sudo pacman -S --noconfirm $packages > /dev/null
  if [[ $(echo $packages|grep -o hyprland) ]]; then
    echo "-> hyprland"
    rm /home/$USER/.config/hypr/hyprland.conf
    curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/.config/hypr/hyprland.conf | tee /home/$USER/.config/hypr/hyprland.conf > /dev/null
  fi
  if [[ $(echo $packages|grep -o autologin) ]]; then
    sudo mkdir /etc/sddm.conf.d/
    echo "-> autologin"
    curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/etc/sddm.conf.d/autologin.conf | sudo tee /etc/sddm.conf.d/autologin.conf > /dev/null
  fi
  if [[ $(echo $packages|grep -o bootmenu) ]]; then
    echo "-> bootloader"
    sudo sed -i "/options/s/$/ quiet/" /boot/loader/entries/$(ls /boot/loader/entries/|grep -v fallback)
    curl -s https://raw.githubusercontent.com/inmymum/dotfiles/main/boot/loader/loader.conf | sudo tee /boot/loader/loader.conf > /dev/null
  fi
fi
