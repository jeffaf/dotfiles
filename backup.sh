#!/bin/bash
# Backup current configs to dotfiles repo

echo "🔄 Backing up dotfiles..."

# Hyprland configs
cp -r ~/.config/hypr/* ./hypr/ 2>/dev/null || echo "No hypr config found"

# Kitty config
cp ~/.config/kitty/kitty.conf ./kitty/ 2>/dev/null || echo "No kitty config found"

# Waybar configs
cp -r ~/.config/waybar/* ./waybar/ 2>/dev/null || echo "No waybar config found"

# AGS configs (if you add them later)
cp -r ~/.config/ags/* ./ags/ 2>/dev/null || echo "No AGS config found"

# Custom scripts
cp -r ~/.local/bin/* ./scripts/ 2>/dev/null || mkdir -p ~/.local/bin

# Wallpapers (if you have custom ones)
cp ~/Pictures/Wallpapers/* ./wallpapers/ 2>/dev/null || echo "No wallpapers found"

# ZSH config
cp ~/.zshrc ./zshrc 2>/dev/null || echo "No zshrc found"

echo "✅ Backup complete!"

# Show what's changed
git status
