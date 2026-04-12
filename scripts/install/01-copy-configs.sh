#!/usr/bin/env bash
set -euo pipefail
mkdir -p ~/.config
# move non-overwriting; create Pictures if needed
mkdir -p ~/Pictures
mv -n ~/dots11/.config/* ~/.config/ 2>/dev/null || true
mv -n ~/dots11/Pictures/* ~/Pictures/ 2>/dev/null || true
echo "Configs and Pictures installed successfully!"
