#!/usr/bin/env bash
set -euo pipefail
themes=(catppuccin-gtk-theme-mocha catppuccin-cursors-mocha)
yay -S --noconfirm "${themes[@]}"
echo "Theme installation completed!"
