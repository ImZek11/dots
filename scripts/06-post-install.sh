#!/usr/bin/env bash
set -euo pipefail

# --- System Cleanup ---
echo "Cleaning up build directories..."
rm -rf ~/go ~/.cargo ~/.config/go

# --- Desktop Entries ---
echo "Setting up custom desktop entries..."
sudo rm -rf /usr/share/applications/*
sudo cp ~/dots11/.desktop/* /usr/share/applications/

# --- SEAMLESS LOGIN CONFIGURATION ---
echo "Configuring TTY1 Autologin & Fish Shell..."

# Detect the real user even if running via sudo
REAL_USER=${SUDO_USER:-$USER}

sudo chsh -s $(which fish) "$REAL_USER"

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
cat <<EOF | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $REAL_USER --noclear %I \$TERM
EOF

sudo systemctl disable sddm.service 2>/dev/null || true

ya pkg add yazi-rs/plugins:mount
ya pkg add yazi-rs/plugins:zoom

echo "Post-installation completed."
