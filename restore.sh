#!/bin/bash

cp -r kde/.config/* ~/.config/
cp -r kde/.local/share/* ~/.local/share/
cp -r fastfetch/.config/* ~/.config/
cp -r kitty/.config/* ~/.config/

echo "✔ Dotfiles restored successfully"
