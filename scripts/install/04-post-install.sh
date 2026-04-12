#!/usr/bin/env bash
set -euo pipefail
rm -rf ~/go
rm -rf ~/.cargo
rm -rf ~/.config/go
sudo rm -rf /usr/share/applications/*
sudo cp ~/dots11/.desktop/* /usr/share/applications/
sudo rm -rf /usr/lib/sddm/sddm.conf.d/*
sudo cp ~/dots11/sddm/default.conf /usr/lib/sddm/sddm.conf.d/
echo "Post-install completed successfully."
