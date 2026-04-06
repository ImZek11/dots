#!/usr/bin/env fish

sleep 5
kitty --detach cava &

sleep 1
kitty --detach rmpc &

sleep 1
kitty --detach peaclock --config-dir ~/.config/peaclock
