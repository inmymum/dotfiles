mkdir ~/.config/hypr ~/.config/niri ~/.config/fuzzel ~/.config/waybar/ ~/.config/waybar/scripts ~/.config/wlogout ~/.config/mako ~/.config/alacritty ~/Pictures
curl -so ~/.config/hypr/hyprlock.conf https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/hypr/hyprlock.conf
curl -so ~/.config/niri/config.kdl https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/niri/config.kdl
curl -so ~/.config/waybar/config.jsonc https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/waybar/config.jsonc
curl -so ~/.config/waybar/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/waybar/style.css
curl -so ~/.config/waybar/scripts/notification-selector https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/waybar/scripts/notification-selector
curl -so ~/.config/waybar/scripts/volume https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/waybar/scripts/volume
curl -so ~/.config/waybar/scripts/brightness https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/waybar/scripts/brightness
curl -so ~/.config/fuzzel/fuzzel.ini https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/fuzzel/fuzzel.ini
curl -so ~/.config/alacritty/alacritty.toml https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/alacritty/alacritty.toml
curl -so ~/.config/mako/config https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/mako/config
curl -so ~/.config/wlogout/layout https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/wlogout/layout
curl -so ~/.config/wlogout/style.css https://raw.githubusercontent.com/inmymum/dotfiles/refs/heads/Restyle/.config/wlogout/style.css
curl -so ~/Pictures/planet_mountains.jpg https://raw.githubusercontent.com/inmymum/dotfiles/Restyle/images/planet_mountains.jpg
rm ~/.bashrc
curl -so ~/.bashrc https://raw.githubusercontent.com/inmymum/dotfiles/Restyle/.bashrc

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
chmod +x ~/.config/waybar/scripts/notification-selector
chmod +x ~/.config/waybar/scripts/brightness
chmod +x ~/.config/waybar/scripts/volume  
