#! /bin/bash

install_dot_files() {
    mkdir -r ~/.config/hypr ~/.config/niri ~/.config/fuzzel ~/.config/waybar/ ~/.config/waybar/scripts ~/.config/wlogout ~/.config/mako ~/.config/alacritty ~/Pictures
    curl -so ~/.config/hypr/hyprlock.conf https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/hypr/hyprlock.conf
    curl -so ~/.config/niri/config.kdl https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/niri/config.kdl
    curl -so ~/.config/waybar/config.jsonc https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/config.jsonc
    curl -so ~/.config/waybar/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/style.css
    curl -so ~/.config/waybar/scripts/notification-selector https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/scripts/notification-selector
    curl -so ~/.config/waybar/scripts/volume https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/scripts/volume
    curl -so ~/.config/waybar/scripts/brightness https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/scripts/brightness
    curl -so ~/.config/fuzzel/fuzzel.ini https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/fuzzel/fuzzel.ini
    curl -so ~/.config/alacritty/alacritty.toml https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/alacritty/alacritty.toml
    curl -so ~/.config/mako/config https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/mako/config
    curl -so ~/.config/wlogout/layout https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/wlogout/layout
    curl -so ~/.config/wlogout/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/wlogout/style.css
    curl -so ~/Pictures/planet_mountains.jpg https://raw.githubusercontent.com/inmymum/dotfiles/main/images/planet_mountains.jpg
    rm ~/.bashrc
    curl -so ~/.bashrc https://raw.githubusercontent.com/inmymum/dotfiles/main/.bashrc

    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    chmod +x ~/.config/waybar/scripts/notification-selector
    chmod +x ~/.config/waybar/scripts/brightness
    chmod +x ~/.config/waybar/scripts/volume  
}

if [[ $(cat /etc/os-release|grep -w "NAME"|awk '{print substr($0, 6)}') = '"Arch Linux"' ]]; then
  sudo pacman -S --noconfirm --needed wget git curl nano mako fuzzel waybar swaybg alacritty ly niri otf-font-awesome brightnessctl gnome-calendar hyprlock make
  clear
  cd ~/ && if [ ! -d yay-bin ]; then git clone https://aur.archlinux.org/yay-bin.git; fi
  clear
  cd yay-bin && makepkg -si
  clear
  yay -S --needed iwmenu-git wlogout librewolf-bin
  clear
  mkdir ~/Installer && cd ~/Installer && git clone https://github.com/jjsullivan5196/wvkbd.git && cd wvkbd && make LAYOUT=deskintlrm && sudo make install && rm -rf ~/Installer ~/.cache/yay ~/.config/yay
  clear
  install_dot_files
  clear
fi

echo "LAST STEPS/INFO:"
echo " Be sure to go through and edit ~/.config/niri/config.kdl to your liking! The defualt is good, however some things might not work for you."
echo ""
echo " If you're not on arch, install the following packages manually: wget git curl nano dunst fuzzel waybar swaybg alacritty ly hyprland ttf-font-awesome brightnessctl chromium"
echo " Also, If you're on a laptop with an intel cpu, install tlp, and run systemctl enable tlp.service"
echo " Otherwise, install power-profiles-daemon, and run systemctl enable power-profiles-daemon"
echo " This will improve your battery a good bit (especially tlp on intel)"
echo ""
echo "Defualt keybinds:"
echo " Windows + Shift + / -> "
echo " Windows + Space -> App launcher"
echo " Windows + Enter -> Terminal"
echo " Windows + Q -> Close current app"
echo " Windows + Shift + F -> fullscreen"

