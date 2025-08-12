# Hyprland Shaders - Cyberpunk Theme

## Available Shaders

### `cyberpunk-subtle.frag`
- **Purpose**: Very conservative cyberpunk color enhancement
- **Effect**: Slightly boosts blue/purple tones, reduces warm colors
- **Intensity**: Minimal (5-8% adjustment)
- **Best for**: General desktop use, maintains readability

### `neutral.frag` 
- **Purpose**: Disable all shader effects
- **Effect**: Simple pass-through, no color changes
- **Use**: Rollback/disable other shaders safely

## Usage Commands

### Test Shaders (Temporary)
```bash
# Apply cyberpunk tint
hyprctl keyword decoration:screen_shader "/home/jeffaf/dotfiles/hypr/shaders/cyberpunk-subtle.frag"

# Disable shaders
hyprctl keyword decoration:screen_shader ""
# OR use neutral shader
hyprctl keyword decoration:screen_shader "/home/jeffaf/dotfiles/hypr/shaders/neutral.frag"
```

### Permanent Config (Add to hyprland.conf after testing)
```bash
# Add this line in hyprland.conf:
# decoration:screen_shader = /home/jeffaf/dotfiles/hypr/shaders/cyberpunk-subtle.frag
```

## Safety Notes
- All shaders are conservative and maintain text readability
- Use `hyprctl keyword decoration:screen_shader ""` for immediate disable
- Test each shader before permanent config changes
- Shaders are GPU-accelerated and performance-optimized for RTX 4060