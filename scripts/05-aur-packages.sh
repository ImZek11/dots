#!/usr/bin/env bash
set -euo pipefail
packages=(
  elephant-bin elephant-providerlist-bin elephant-desktopapplications-bin
  walker peaclock oh-my-posh
)
echo "Installing packages..."
yay -S --noconfirm "${packages[@]}"

echo "Enabling services..."
sudo systemctl enable mpd
sudo systemctl start mpd
sudo systemctl enable power-profiles-daemon
sudo systemctl start power-profiles-daemon

echo "Program installations and service activations completed!"
