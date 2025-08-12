#!/bin/bash
# Install dotfiles on a fresh system

echo "🚀 Installing dotfiles..."

# Create config directories
mkdir -p ~/.config/{hypr,kitty,waybar,ags}
mkdir -p ~/.local/bin
mkdir -p ~/Pictures/Wallpapers

# Install Hyprland configs
cp -r ./hypr/* ~/.config/hypr/ 2>/dev/null || echo "No hypr configs to install"

# Install Kitty config
cp ./kitty/kitty.conf ~/.config/kitty/ 2>/dev/null || echo "No kitty config to install"

# Install Waybar configs
cp -r ./waybar/* ~/.config/waybar/ 2>/dev/null || echo "No waybar configs to install"

# Install AGS configs
cp -r ./ags/* ~/.config/ags/ 2>/dev/null || echo "No AGS configs to install"

# Install custom scripts
cp ./scripts/* ~/.local/bin/ 2>/dev/null || echo "No scripts to install"
chmod +x ~/.local/bin/* 2>/dev/null

# Install wallpapers
cp ./wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null || echo "No wallpapers to install"

# Install ZSH config
cp ./zshrc ~/.zshrc 2>/dev/null || echo "No zshrc to install"

echo "✅ Installation complete!"
echo "🔄 Reload Hyprland: hyprctl reload"
