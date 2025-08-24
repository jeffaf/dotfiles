#!/bin/bash

# Get Bluetooth device battery level for waybar
# Returns battery percentage of connected Bluetooth devices

# Get connected Bluetooth devices with battery info
bluetooth_info=$(bluetoothctl info | grep -E "(Name|Battery Percentage|Connected: yes)" | grep -A2 "Connected: yes")

if [ -z "$bluetooth_info" ]; then
    # No connected Bluetooth devices
    echo "󰂲 --"
    exit 0
fi

# Extract battery percentage
battery=$(echo "$bluetooth_info" | grep "Battery Percentage" | head -1 | grep -o "0x[0-9a-fA-F]* ([0-9]*)" | grep -o "([0-9]*)" | tr -d "()")

if [ -z "$battery" ]; then
    # Connected but no battery info
    echo "󰂯 ∞"
else
    # Show battery percentage
    if [ "$battery" -ge 80 ]; then
        echo "󰥈 ${battery}%"
    elif [ "$battery" -ge 60 ]; then
        echo "󰤾 ${battery}%"
    elif [ "$battery" -ge 40 ]; then
        echo "󰤽 ${battery}%"
    elif [ "$battery" -ge 20 ]; then
        echo "󰤼 ${battery}%"
    else
        echo "󰤻 ${battery}%"
    fi
fi