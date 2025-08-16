#!/bin/bash
# Toggle anime system monitor widget

# Check if widget is currently running
if eww active-windows | grep -q "anime-system-monitor"; then
    # Widget is open, close it
    eww close anime-system-monitor &
else
    # Widget is closed, open it
    eww open anime-system-monitor &
fi