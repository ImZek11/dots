#!/usr/bin/env bash
set -euo pipefail
themes=(catppuccin-gtk-theme-mocha catppuccin-cursors-mocha)
yay -S --noconfirm "${themes[@]}"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-blue-standard+default"
echo "Theme installation completed!"
