## About
These are dotfiles for both my niri configs that I use.

## Screenshots
![Uncollapsed](https://github.com/user-attachments/assets/bb7c5e38-b51a-48cc-a4da-6b70034af426)
![collapsed](https://github.com/user-attachments/assets/f7b0e0c7-88d3-4ebf-97b5-a9b18debc8d4)

### Important!
Be sure to install a ```ttf-font``` so alacritty will launch

### Utilies
wayland compositor ```niri```

tui display manager: ```ly```

terminal: ```alacritty```

text editor: ```nano```

background: ```swaybg```

status bar: ```waybar``` (needs ```ttf-font-awesome```)

iwctl gui: ```iwmenu``` ([AUR](https://aur.archlinux.org/packages/iwmenu)) (needs ```fuzzel```)

logout gui: ```wlogout```([AUR](https://aur.archlinux.org/packages/wlogout)) 

notification manager: ```dunst```

app launcher: ```fuzzel```



```
sudo pacman -S --needed alacritty nano swaybg niri waybar otf-font-awesome fuzzel ly dunst
sudo yay -S iwmenu wlogout
sudo systemctl enable ly
```








