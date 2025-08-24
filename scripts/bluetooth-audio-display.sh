#!/bin/bash

# Combined Bluetooth battery + audio display for waybar
# Shows Bluetooth device battery when connected, otherwise shows regular audio

# Check if Bluetooth devices are connected
bluetooth_info=$(bluetoothctl info | grep -E "(Name|Battery Percentage|Connected: yes)" | grep -A2 "Connected: yes")

if [ -n "$bluetooth_info" ]; then
    # Bluetooth device connected - show battery
    battery=$(echo "$bluetooth_info" | grep "Battery Percentage" | head -1 | grep -o "0x[0-9a-fA-F]* ([0-9]*)" | grep -o "([0-9]*)" | tr -d "()")
    
    if [ -n "$battery" ]; then
        # Show Bluetooth battery with icon
        if [ "$battery" -ge 80 ]; then
            echo "󰂯 ${battery}%"
        elif [ "$battery" -ge 60 ]; then
            echo "󰂯 ${battery}%"
        elif [ "$battery" -ge 40 ]; then
            echo "󰂯 ${battery}%"
        elif [ "$battery" -ge 20 ]; then
            echo "󰂯 ${battery}%"
        else
            echo "󰂯 ${battery}%"
        fi
    else
        # Connected but no battery info - show regular Bluetooth icon
        echo "󰂯 ∞"
    fi
else
    # No Bluetooth connected - show regular audio volume
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -1 | tr -d '%')
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes\|no')
    
    if [ "$muted" = "yes" ]; then
        echo "󰖁 Muted"
    else
        # Show volume with appropriate icon
        if [ "$volume" -ge 70 ]; then
            echo "󰕾 ${volume}%"
        elif [ "$volume" -ge 30 ]; then
            echo "󰖀 ${volume}%"
        else
            echo "󰕿 ${volume}%"
        fi
    fi
fi