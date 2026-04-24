#!/usr/bin/env bash
set -euo pipefail
packages=(
  elephant-bin elephant-providerlist-bin elephant-desktopapplications-bin
  walker peaclock oh-my-posh
)
echo "Installing packages..."
yay -S --noconfirm "${packages[@]}"

echo "AUR packages installation completed!"
