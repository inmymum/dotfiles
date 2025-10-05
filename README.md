## About
These are dotfiles for both my niri configs that I use.

## Screenshots
OLD STYLE
![Uncollapsed](https://github.com/user-attachments/assets/bb7c5e38-b51a-48cc-a4da-6b70034af426)
![collapsed](https://github.com/user-attachments/assets/f7b0e0c7-88d3-4ebf-97b5-a9b18debc8d4)
NEW STYLE
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e956c801-2a5b-48cc-8737-2c6984727fc1" />


### Important!
Be sure to install a ```ttf-font``` so alacritty will launch

### Utilies
wayland compositor ```niri```

tui display manager: ```ly```

terminal: ```alacritty```

text editor: ```nano```

background: ```swaybg```

status bar: ```waybar``` (needs ```otf-font-awesome```)

iwctl gui: ```iwmenu``` ([AUR](https://aur.archlinux.org/packages/iwmenu-git)) (needs ```fuzzel```)

logout gui: ```wlogout```([AUR](https://aur.archlinux.org/packages/wlogout)) 

notification manager: ```mako```

app launcher: ```fuzzel```

on screen keyboard: ```wvkbd-mobintl```([AUR](https://aur.archlinux.org/packages/wvkbd-git))



```
sudo pacman -S --needed alacritty nano swaybg niri waybar otf-font-awesome fuzzel ly
sudo yay -S iwmenu-git wlogout wvkbd-git
sudo systemctl enable ly
```








