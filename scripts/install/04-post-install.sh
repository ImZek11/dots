#!/usr/bin/env bash
set -euo pipefail
rm -rf ~/go
rm -rf ~/.cargo
rm -rf ~/.config/go
sudo rm -rf /usr/share/applications/*
sudo cp ~/dots11/.desktop/* /usr/share/applications/
echo "Post-installation completed!"
