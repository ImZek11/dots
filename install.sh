#!/bin/bash

ansi_art1='
████████▄   ▄██████▄      ███        ▄████████     ████      ████
███   ▀███ ███    ███ ▀█████████▄   ███    ███   ██████    ██████
███    ███ ███    ███    ▀███▀▀██   ███    █▀      ████      ████
███    ███ ███    ███     ███   ▀   ███            ████      ████
███    ███ ███    ███     ███     ▀███████████     ████      ████
███    ███ ███    ███     ███              ███     ████      ████
███   ▄███ ███    ███     ███        ▄█    ███     ████      ████
████████▀   ▀██████▀     ▄████▀    ▄████████▀    ████████  ████████
                                                                  '
clear
echo -e "\n$ansi_art1\n"

read -p "Start installation? (y/n): " choice
choice=${choice,,}

if [[ "$choice" == "y" ]]; then
    clear
    mv ~/dots11/.config/* ~/.config/
    mv ~/dots11/Pictures/ ~/
    echo "Configs And Pictures installed successfully!"

    # Second prompt
    read -p "Do you want to continue with the installation? (y/n): " choice2
    choice2=${choice2,,}
    if [[ "$choice2" == "y" ]]; then
        yay -S hyprland kitty fish sddm ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra elephant-bin elephant-providerlist-bin elephant-desktopapplications-bin waybar fastfetch yazi swayn hyprshot hyprpaper hypridle hyprlock polkit-gnome nvim btop impala wiremix cava rmpc nwg-look mpd mpc walker peaclock oh-my-posh firefox
        
        echo "Enabling Services..."
        sudo systemctl enable sddm
        sudo systemctl enable mpd
        sudo systemctl start mpd
        
        echo "Programs installed, services enabled, and SDDM configured successfully!"

        # Third prompt
        read -p "Do you want to proceed with theme installation? (y/n): " choice3
        choice3=${choice3,,}
        if [[ "$choice3" == "y" ]]; then
            yay -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha
            echo "Installation fully completed!"

            # Fourth prompt: reboot
            read -p "Do you want to reboot now? (y/n): " choice4
            choice4=${choice4,,}
            if [[ "$choice4" == "y" ]]; then
                echo "Rebooting..."
                sudo reboot
            elif [[ "$choice4" == "n" ]]; then
                echo "Reboot cancelled. You can reboot later if needed."
            else
                echo "Invalid input. Please enter 'y' or 'n'."
            fi

        elif [[ "$choice3" == "n" ]]; then
            echo "Theme installation skipped."
        else
            echo "Invalid input. Please enter 'y' or 'n'."
        fi

    elif [[ "$choice2" == "n" ]]; then
        echo "Installation cancelled."
    else
        echo "Invalid input. Please enter 'y' or 'n'."
    fi

elif [[ "$choice" == "n" ]]; then
    echo "Installation cancelled"
else
    echo "Invalid input. Please enter 'y' or 'n'."
fi
