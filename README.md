## About
These are dotfiles for both my niri configs that I use.
### Important!
Be sure to install a ```ttf-font``` so alacritty will launch
In order to add a niri session to lemurs add the following to /etc/lemurs/wayland/niri

In order to add a niri session edit: /etc/lemurs/wayland/niri to contain
```
#! /bin/bash
exec niri
```
and make it executable with ```sudo chmod +755 /etc/lemurs/wayland/niri```

### Utilies
terminal: ```alacritty```

browser: ```mercury-browser```

background: ```swaybg``` 

status bar: ```waybar``` (needs ```ttf-font-awesome```)

app launcher: ```fuzzel```










