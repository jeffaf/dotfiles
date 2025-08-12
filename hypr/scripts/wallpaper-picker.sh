#!/bin/bash

# Cyberpunk Wallpaper Picker with Pywal Integration
WALLPAPER_DIR="/home/jeffaf/dotfiles/wallpapers"
CACHE_DIR="$HOME/.cache/wallpaper"
CURRENT_WALLPAPER_FILE="$CACHE_DIR/current"

# Create directories
mkdir -p "$CACHE_DIR"
mkdir -p "$WALLPAPER_DIR/cyberpunk"

# Function to download sample cyberpunk wallpapers if none exist
download_sample_wallpapers() {
    if [ ! "$(ls -A $WALLPAPER_DIR)" ]; then
        echo "Downloading sample cyberpunk wallpapers..."
        
        # Create sample wallpaper with ImageMagick (if available)
        if command -v convert &> /dev/null; then
            # Generate a gradient wallpaper
            convert -size 2560x1440 gradient:'#1a1b26-#bb9af7' "$WALLPAPER_DIR/cyberpunk/gradient_purple.png"
            convert -size 2560x1440 gradient:'#1a1b26-#7aa2f7' "$WALLPAPER_DIR/cyberpunk/gradient_blue.png"
            convert -size 2560x1440 radial-gradient:'#bb9af7-#1a1b26' "$WALLPAPER_DIR/cyberpunk/radial_purple.png"
            echo "Generated sample wallpapers"
        else
            echo "Install imagemagick to generate sample wallpapers"
            echo "Or add your own wallpapers to $WALLPAPER_DIR"
        fi
    fi
}

# Function to set wallpaper and generate colors
set_wallpaper() {
    local wallpaper="$1"
    
    # Generate colors with pywal
    wal -i "$wallpaper" -n -q
    
    # Set wallpaper with hyprpaper (Wayland method)
    if pgrep -x "hyprpaper" > /dev/null; then
        # Kill existing hyprpaper
        killall hyprpaper 2>/dev/null
        sleep 0.5
    fi
    
    # Update hyprpaper config
    cat > /home/jeffaf/dotfiles/hypr/hyprpaper.conf << EOF
splash = false
ipc = on

preload = $wallpaper
wallpaper = HDMI-A-1,$wallpaper
wallpaper = eDP-1,$wallpaper
EOF
    
    # Copy config to active location
    cp /home/jeffaf/dotfiles/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
    
    # Start hyprpaper with new config
    hyprpaper -c ~/.config/hypr/hyprpaper.conf &
    
    # Save current wallpaper
    echo "$wallpaper" > "$CURRENT_WALLPAPER_FILE"
    
    # Update waybar colors
    update_waybar_colors
    
    # Reload waybar
    killall waybar 2>/dev/null
    waybar &
    
    # Send notification
    if command -v notify-send &> /dev/null; then
        notify-send "Wallpaper Changed" "$(basename "$wallpaper")" -i "$wallpaper"
    fi
}

# Function to update waybar colors from pywal
update_waybar_colors() {
    if [ -f "$HOME/.cache/wal/colors.sh" ]; then
        source "$HOME/.cache/wal/colors.sh"
        
        # Create dynamic waybar style
        cat > /tmp/waybar-pywal.css << EOF
/* Pywal generated colors for waybar */
window#waybar {
    background: linear-gradient(135deg, ${color0}ee, ${color8}ee);
    border: 1px solid ${color5}55;
}

#workspaces button.active {
    background: linear-gradient(45deg, ${color5}, ${color4});
    color: ${color0};
}

#workspaces button:hover {
    background: ${color5}33;
    color: ${color5};
}

#cpu { color: ${color4}; }
#memory { color: ${color5}; }
#temperature { color: ${color2}; }
#custom-gpu { color: ${color6}; }
#network { color: ${color6}; }
#pulseaudio { color: ${color5}; }
#battery { color: ${color2}; }
#clock { color: ${color7}; }
#custom-power { color: ${color1}; }
#custom-wallpaper { color: ${color3}; }
EOF
    fi
}

# Function to show wallpaper picker with wofi
show_picker() {
    # Find all image files
    find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | \
    sort | \
    while read -r wallpaper; do
        basename "$wallpaper"
    done | \
    wofi --dmenu --prompt "Choose wallpaper:" --cache-file=/dev/null | \
    while read -r chosen; do
        if [ -n "$chosen" ]; then
            # Find the full path
            full_path=$(find "$WALLPAPER_DIR" -name "$chosen" -type f | head -1)
            if [ -n "$full_path" ]; then
                set_wallpaper "$full_path"
            fi
        fi
    done
}

# Function to cycle to next wallpaper
cycle_wallpaper() {
    local wallpapers=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sort))
    
    if [ ${#wallpapers[@]} -eq 0 ]; then
        echo "No wallpapers found"
        return 1
    fi
    
    local current=""
    if [ -f "$CURRENT_WALLPAPER_FILE" ]; then
        current=$(cat "$CURRENT_WALLPAPER_FILE")
    fi
    
    local next_index=0
    for i in "${!wallpapers[@]}"; do
        if [ "${wallpapers[$i]}" = "$current" ]; then
            next_index=$(( (i + 1) % ${#wallpapers[@]} ))
            break
        fi
    done
    
    set_wallpaper "${wallpapers[$next_index]}"
}

# Main logic
case "${1:-picker}" in
    "picker")
        download_sample_wallpapers
        show_picker
        ;;
    "cycle")
        download_sample_wallpapers
        cycle_wallpaper
        ;;
    "set")
        if [ -n "$2" ] && [ -f "$2" ]; then
            set_wallpaper "$2"
        else
            echo "Usage: $0 set /path/to/wallpaper.jpg"
        fi
        ;;
    *)
        echo "Usage: $0 {picker|cycle|set /path/to/wallpaper}"
        ;;
esac