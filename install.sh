#! /bin/bash

install_files() {
    mkdir ~/.config/hypr ~/.config/niri ~/.config/fuzzel ~/.config/waybar ~/.config/wlogout ~/.config/dunst ~/.config/alacritty ~/Pictures ~/.local/share/scripts
    curl -so ~/.config/hypr/hyprland.conf https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/hypr/hyprland.conf
    curl -so ~/.config/hypr/hypridle.conf https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/hypr/hypridle.conf
    curl -so ~/.config/hypr/hyprlock.conf https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/hypr/hyprlock.conf
    curl -so ~/.config/niri/config.kdl https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/niri/config.kdl
    curl -so ~/.config/waybar/config.jsonc https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/config.jsonc
    curl -so ~/.config/waybar/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/waybar/style.css
    curl -so ~/.config/fuzzel/fuzzel.ini https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/fuzzel/fuzzel.ini
    curl -so ~/.config/alacritty/alacritty.toml https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/alacritty/alacritty.toml
    curl -so ~/.config/dunst/dunstrc https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/dunst/dunstrc
    curl -so ~/.config/wlogout/layout https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/wlogout/layout
    curl -so ~/.config/wlogout/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.config/wlogout/style.css
    curl -so ~/Pictures/background.jpg https://raw.githubusercontent.com/inmymum/dotfiles/main/images/planet_mountains.jpg
    curl -so ~/.local/share/scripts/fuzzel_with_web_search.sh https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/main/.local/share/scripts/fuzzel_with_web_search.sh

    rm ~/.bashrc
    curl -so ~/.bashrc https://raw.githubusercontent.com/inmymum/dotfiles/main/.bashrc
}

if [[ $(cat /etc/os-release|grep -w "NAME"|awk '{print substr($0, 6)}') = '"Arch Linux"' ]]; then
  sudo pacman -S --noconfirm --needed wget git curl nano dunst fuzzel waybar swaybg alacritty ly niri ttf-font-awesome brightnessctl chromium hypridle hyprlock
  cd ~/ && if [ ! -d yay-bin ]; then git clone https://aur.archlinux.org/yay-bin.git; fi
  cd yay-bin && makepkg -si
  yay -S --needed iwmenu-git wlogout
  cd ~/ && rm -rf ~/.cache/yay ~/.config/yay
  install_files
fi

echo "LAST STEPS/INFO:"
echo " Be sure to go through and edit either ~/.config/niri/config.kdl or ~/.config/hypr/hyprland.conf respectively to your liking! Otherwise things might not work for you."
echo ""
echo " If you're not on arch, install the following packages manually: wget git curl nano dunst fuzzel waybar swaybg alacritty ly hyprland ttf-font-awesome brightnessctl chromium"
echo " Also, If you're on a laptop with an intel cpu, install tlp, and run systemctl enable tlp.service"
echo " Otherwise, install power-profiles-daemon, and run systemctl enable power-profiles-daemon"
echo " This will improve your battery a good bit (especially tlp on intel)"
echo ""
echo "Defualt keybinds:"
echo " Windows + Space -> App launcher with web search functionality"
echo " Windows + Enter -> Terminal"
echo " Windows + B -> Browser"
echo " Windows + Q -> Close current app"
echo " F6-F7 -> brightness"
echo " F9-F10 -> volume"
echo " F11 -> fullscreen"
echo " If app search is enabled:"
echo " Super + S: App instance search"
echo " Escape: Disable app instance search"
