#! /bin/bash

install_config_files() {
    mkdir ~/.config/niri ~/.config/fuzzel ~/.config/waybar ~/.config/wlogout ~/.config/dunst ~/.config/alacritty ~/Pictures
    curl -so ~/.config/niri/config.kdl https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/niri/config.kdl
    curl -so ~/.config/waybar/config.jsonc https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/config.jsonc
    curl -so ~/.config/waybar/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/style.css
    curl -so ~/.config/fuzzel/fuzzel.ini https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/fuzzel/fuzzel.ini
    curl -so ~/.config/alacritty/alacritty.toml https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/alacritty/alacritty.toml
    curl -so ~/.config/dunst/dunstrc https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/dunst/dunstrc
    curl -so ~/.config/wlogout/layout https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/wlogout/layout
    curl -so ~/.config/wlogout/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/wlogout/style.css
    curl -so ~/Pictures/background.jpg https://raw.githubusercontent.com/inmymum/dotfiles/main/images/planet_mountains.jpg
    sed -i -e "s/example_user/$USER/" ~/.config/niri/config.kdl
    rm ~/.bashrc
    curl -so ~/.bashrc https://raw.githubusercontent.com/inmymum/dotfiles/main/.bashrc
}
enable_services() {
  read -s -n 1 -p "Do you want to enable bluetooth manager? enter y or n: " install_bluetooth
  if [[ "$install_bluetooth" == "y" ]]; then clear && echo "Enabling bluetooth" && sudo systemctl enable bluetooth 2&>1; fi
  read -s -n 1 -p "Do you want to enable tui display manager? enter y or n: " install_ly
  if [[ "$install_ly" == "y" ]]; then echo "Enabling ly" && sudo systemctl enable ly 2&>1; fi
  read -s -n 1 -p "Do you want to enable tlp power management (Should use if on a laptop)? enter y or n: " install_tlp
  if [[ "$install_tlp" == "y" ]]; then clear && echo "Enabling tlp" && sudo systemctl enable tlp 2&>1; fi
}

if [[ $(cat /etc/os-release|grep -w "NAME"|awk '{print substr($0, 6)}') = '"Arch Linux"' ]]; then
  sudo pacman -S --noconfirm --needed wget git curl nano tlp dunst fuzzel waybar swaybg alacritty ly niri gnu-free-fonts ttf-font-awesome brightnessctl chromium blueman
  enable_services
  cd ~/ && if [ ! -d yay-bin ]; then git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -sci 2&>1; fi
  echo "Installing browser and utilities"
  yay -S --cleanafter -answerclean N --answerdiff N --removemake --needed iwmenu-git wlogout mercury-browser-bin 2&>1
  echo "Cleaning cache"
  cd ~/ && rm -rf ~/.cache/yay
  install_config_files
else
  echo "This install script is made for arch."
  read -s -p "Do you want to manually install the depedencies and copy the config files anyway? y or n " install_check
  if [[ "$intall_check" == "y" ]]; then echo "install: wget git curl nano tlp dunst fuzzel waybar swaybg alacritty ly niri gnu-free-fonts ttf-font-awesome iwmenu wlogout" && echo "and run this script again" && install_config_files; fi
fi
