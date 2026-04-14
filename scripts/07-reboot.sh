#!/usr/bin/env bash
set -euo pipefail
echo "Rebooting..."
rm -- "$0"
sudo reboot
