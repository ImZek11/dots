#!/usr/bin/env bash
set -euo pipefail

# Check for yay; if present, show path and pause 1 second, otherwise install it from AUR
if command -v yay >/dev/null 2>&1; then
  echo "YAY is already installed"
else
  # Create a temporary build directory and clean up on exit
  build_dir="$(mktemp -d /tmp/yay-install.XXXXXX)"
  cleanup() { rm -rf "$build_dir"; }
  trap cleanup EXIT

  echo "Cloning YAY into $build_dir"
  git clone https://aur.archlinux.org/yay.git "$build_dir/yay"
  cd "$build_dir/yay"

  echo "Building and installing YAY"
  makepkg -si --noconfirm

  echo "Done. YAY should now be installed"
fi

