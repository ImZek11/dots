#!/usr/bin/env bash
set -euo pipefail
echo "Rebooting..."
rm -rf ~/dots11
history -c && history -w
sudo reboot
