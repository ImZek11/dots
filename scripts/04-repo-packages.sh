#!/usr/bin/env bash
set -euo pipefail
packages=(
  hyprland kitty fish uwsm xdg-desktop-portal-gtk ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
  noto-fonts-extra waybar fastfetch yazi swaync hyprshot hyprpaper hypridle hyprlock polkit-gnome nvim btop
  impala wiremix cava rmpc nwg-look mpd mpc firefox xdg-utils brightnessctl python-gobject imagemagick
)
echo "Installing packages..."
sudo pacman -S --noconfirm "${packages[@]}"

echo "REPO packages installation completed!"
