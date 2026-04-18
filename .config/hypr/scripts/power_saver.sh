#!/bin/bash

# Configuration
LOW_BATTERY_THRESHOLD=30
LOW_BRIGHTNESS="30%"
CHARGING_BRIGHTNESS="80%"
BAT=$(ls /sys/class/power_supply/ | grep BAT | head -n 1)

# Variable to track state and prevent command spam
LAST_STATE="none"

while true; do
    CAPACITY=$(cat /sys/class/power_supply/$BAT/capacity)
    STATUS=$(cat /sys/class/power_supply/$BAT/status)

    # CASE 1: Charging or Full
    if [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Full" ]; then
        if [ "$LAST_STATE" != "charging" ]; then
            powerprofilesctl set performance
            brightnessctl set "$CHARGING_BRIGHTNESS"
            notify-send "Power Connected" "Performance mode & 80% Brightness"
            LAST_STATE="charging"
        fi

    # CASE 2: Discharging and Low Battery
    elif [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le "$LOW_BATTERY_THRESHOLD" ]; then
        if [ "$LAST_STATE" != "low_battery" ]; then
            powerprofilesctl set power-saver
            brightnessctl set "$LOW_BRIGHTNESS"
            notify-send -u critical "Battery Low" "Power Saver mode active"
            LAST_STATE="low_battery"
        fi

    # CASE 3: Discharging but still above threshold
    else
        if [ "$LAST_STATE" != "discharging_normal" ]; then
            powerprofilesctl set balanced
            LAST_STATE="discharging_normal"
        fi
    fi

    sleep 10
done

