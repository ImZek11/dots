#!/bin/bash

# Import common variables if needed
if [ -f "common.sh" ]; then
    source common.sh
fi

OLD_USER="zek11"
CURRENT_USER=$(whoami)

# Apply the fix to the installed .config files in the user's home
if [ -d "$HOME/.config" ]; then
    find "$HOME/.config" -type f -exec sed -i "s|/home/$OLD_USER|/home/$CURRENT_USER|g" {} +
    echo "Hardcoded paths fix completed"
else
    echo "Error: .config directory not found in $HOME"
    exit 1
fi
