#! /bin/bash

install_files() {
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
    sed -i -e "s/example_user/$USER/" .config/niri/config.kdl
    rm ~/.bashrc
    curl -so ~/.bashrc https://raw.githubusercontent.com/inmymum/dotfiles/main/.bashrc
}

if [[ $(cat /etc/os-release|grep -w "NAME"|awk '{print substr($0, 6)}') = '"Arch Linux"' ]]; then
  sudo pacman -S --noconfirm --needed wget git curl nano tlp dunst fuzzel waybar swaybg alacritty ly niri gnu-free-fonts ttf-font-awesome brightnessctl
  cd ~/ && if [ ! -d yay-bin ]; then git clone https://aur.archlinux.org/yay-bin.git; fi
  cd yay-bin && makepkg -si
  yay -S --needed iwmenu-git wlogout mercury-browser-bin
  cd ~/ && rm -rf ~/.cache/yay ~/.config/yay
  install_files
fi
