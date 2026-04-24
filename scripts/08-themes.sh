#!/usr/bin/env bash
set -euo pipefail
themes=(catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-icon-theme nwg-look kvantum-theme-catppuccin-git kvantum qt5ct qt6ct kvantum-qt5 kvantum-qt6)
yay -S --noconfirm "${themes[@]}"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-blue-standard+default"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
echo "Theme installation completed!"
