#!/usr/bin/env bash
set -euo pipefail

# scripts/choose-kb-layout.sh
# Prompt for layout and replace kb_layout value in ~/.config/hypr/modules/input.conf
# No backup, exits on error.

# 1) Prompt
read -rp "Enter keyboard layout code (e.g. us, it, de, fr). Leave empty to cancel: " layout
[ -z "$layout" ] && { echo "Cancelled."; exit 0; }

# 2) Normalize input
layout="$(printf '%s' "$layout" | tr 'A-Z' 'a-z' | tr -d '[:space:]')"
[ -z "$layout" ] && { echo "Invalid layout."; exit 1; }

# 3) Ensure target exists
TARGET="$HOME/.config/hypr/modules/input.conf"
if [ ! -f "$TARGET" ]; then
  echo "Error: $TARGET not found" >&2
  exit 1
fi

# 4) Escape replacement string for sed
esc_layout="$(printf '%s' "$layout" | sed 's/[\/&]/\\&/g')"

# 5) Replace whatever value is currently set for kb_layout with the chosen layout
#    Keeps spacing and trailing comments intact, case-insensitive for the key.
sed -E "s/^([[:space:]]*kb_layout[[:space:]]*=[[:space:]]*)[^[:space:]#;]+([[:space:]]*(#.*)?$)/\\1${esc_layout}\\2/I" \
  "$TARGET" > "$TARGET.tmp" && mv "$TARGET.tmp" "$TARGET"

echo "Updated $TARGET with layout: $layout"

