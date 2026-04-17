#!/usr/bin/env bash
set -euo pipefail
packages=(
  hyprland kitty fish uwsm ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
  noto-fonts-extra elephant-bin elephant-providerlist-bin elephant-desktopapplications-bin
  waybar fastfetch yazi swaync hyprshot hyprpaper hypridle hyprlock polkit-gnome nvim btop
  impala wiremix cava rmpc nwg-look mpd mpc walker peaclock oh-my-posh firefox
)
echo "Installing packages..."
yay -S --noconfirm "${packages[@]}"

echo "Enabling services..."
sudo systemctl enable mpd
sudo systemctl start mpd

echo "Program installations and service activations completed!"
