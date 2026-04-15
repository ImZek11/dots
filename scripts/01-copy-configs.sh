#!/usr/bin/env bash
set -euo pipefail

# 1. Create necessary directories
mkdir -p ~/.config/fish
mkdir -p ~/Pictures
mkdir -p ~/Music
mkdir -p ~/.peaclock

# 2. Move configs and pictures (non-overwriting)
mv -n ~/dots11/.config/* ~/.config/ 2>/dev/null || true
mv -n ~/dots11/Pictures/* ~/Pictures/ 2>/dev/null || true
mv -n ~/dots11/.peaclock/* ~/peaclock/ 2>/dev/null || true

# 3. Ensure the dots11 Fish config is the active one
cp ~/dots11/.config/fish/config.fish ~/.config/fish/config.fish

echo "Configs, Pictures, Peaclock and Seamless login installation completed!"
