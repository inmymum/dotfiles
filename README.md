# These are dotfiles for both my niri and hyprland configs that I have used or are using.

### Lemurs --- (display manager)

In order to add a session to lemurs run:

```desktop="niri" echo "exec niri" | sudo tee /etc/lemurs/wayland/$desktop```

And make it executable: 
```desktop="niri" sudo chmod 755 /etc/lemurs/wayland/$desktop```

Be sure to install xorg-xauth so inputs work in niri
