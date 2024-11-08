# These are dotfiles for both my niri and hyprland configs that I have used or are using.

### Lemurs --- (display manager)

In order to set up lemurs install it and enable the service:

```sudo pacman -S lemurs```

```sudo systemctl enable lemurs```

In order to add a session to lemurs run:

```echo exec=niri | sudo tee /etc/lemurs/wayland/niri```

Make it executable: 
```sudo chmod 755 /etc/lemurs/wayland/```

