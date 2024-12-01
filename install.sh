#! /bin/bash

install_arch() {
    mkdir ~/.config/niri ~/.config/fuzzel ~/.config/waybar ~/.config/wlogout ~/.config/dunst ~/.config/alacritty ~/Pictures
    curl -so ~/.config/niri/config.kdl https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/niri/config.kdl
    curl -so ~/.config/waybar/config.jsonc https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/config.jsonc
    curl -so ~/.config/waybar/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/style.css
    curl -so ~/.config/fuzzel/fuzzel.ini https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/fuzzel/fuzzel.ini
    curl -so ~/.config/alacritty/alacritty.toml https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/alacritty/alacritty.toml
    curl -so ~/.config/dunst/dunstrc https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/dunst/dunstrc
    curl -so ~/.config/wlogout/layout https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/wlogout/layout
    curl -so ~/.cofing/wlogout/style.css https://github.com/inmymum/dotfiles/blob/main/.config/wlogout/style.css
    curl -so ~/Pictures/background.jpg https://raw.githubusercontent.com/inmymum/dotfiles/main/images/planet_mountains.jpg
}

if [[ $(cat /etc/os-release|grep -w "NAME"|awk '{print substr($0, 6)}') = '"Arch Linux"' ]]; then
    if [ ! -f "/usr/bin/yay" ]; then
        if [ -f "/usr/bin/git" ]; then
            cd ~/ && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd ~/ && rm -rf yay-bin && yay -S --noconfirm --needed iwmenu-git wlogout alacritty nano curl swaybg niri waybar ttf-font-awesome fuzzel ly dunst && rm -rf ~/.cache/yay ~/.config/yay && install_arch()
        else
            sudo pacman -S --noconfirm git && cd ~/ && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd ~/ && rm -rf yay-bin && yay -S --noconfirm --needed wlogout iwmenu-git alacritty nano curl swaybg niri waybar ttf-font-awesome fuzzel ly dunst && rm -rf ~/.cache/yay ~/.config/yay && install_arch()
        fi
    else
        yay -S --noconfirm --needed iwmenu-git wlogout alacritty tlp nano swaybg niri waybar ttf-font-awesome curl fuzzel ly dunst && system && rm -rf ~/.cache/yay ~/.config/yay && install_arch()
fi
