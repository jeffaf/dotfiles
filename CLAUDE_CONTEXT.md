# My Hyprland Rice Setup - Context for Claude Code

## System Information
- **OS**: CachyOS (Arch-based)
- **WM**: Hyprland (Wayland)
- **Terminal**: Kitty with Iosevka Nerd Font (size 14)
- **Bar**: Waybar (top bar)
- **Launcher**: wofi
- **Hardware**: AMD Ryzen 9 7945HX, RTX 4060 Mobile, 62GB RAM
- **Monitors**: 
  - External: HDMI-A-1 (1920x1080@75Hz) - Left monitor
  - Laptop: eDP-1 (2560x1440@240Hz) - Right monitor (primary for gaming)

## Aesthetic Preferences & Choices Made
- **Theme**: Dark with purple/blue accents (cyberpunk aesthetic)
- **Style**: Cyberpunk, anime-inspired, but open to suggestions
- **Colors**: Purple (#bb9af7), Blue (#89b4fa), Dark backgrounds
- **Font**: Iosevka Nerd Font (chosen for hacker/ricing aesthetic)
- **Window Effects**: 
  - Opacity: Active 95%, Inactive 90%
  - Border animations with purple/blue gradient
  - Smooth transitions and hover effects
- **Wallpapers**: Organized by theme (cyberpunk, purple-blue, minimal, dark-themes)
- *REview /r/unixporn, /r/hyprland, for guides and inspiration. 
## Current Working Configuration

### Key Features Working Well:
- ✅ Dual monitor setup with proper scaling (laptop screen 1.1x, external 1.0x)
- ✅ Beautiful window hover effects (opacity + border color changes)
- ✅ Gaming optimizations (tearing allowed, NVIDIA settings)
- ✅ Workspace organization (1-4 general, 5 gaming, 6-8 pentesting tools)
- ✅ Transparent terminal background (kitty with 85% opacity)
- ✅ Copy/paste working with cliphist
- ✅ Screenshot system (grim + slurp)

### Dotfiles Structure:
```
~/dotfiles/
├── hypr/           # Hyprland configs
├── kitty/          # Terminal config  
├── waybar/         # Status bar config
├── scripts/        # Custom scripts
├── wallpapers/     # Favorite wallpapers (symlinks)
├── backup.sh       # Backup current configs
├── install.sh      # Restore configs
└── quick-commands.sh # Git management
```

## Workflow & Safety Practices

### IMPORTANT: Always Follow This Workflow
1. **Before making ANY changes**: 
   ```bash
   cd ~/dotfiles && ./quick-commands.sh backup
   ```

2. **After Claude Code makes changes**:
   ```bash
   cd ~/dotfiles && ./quick-commands.sh backup
   hyprctl reload  # Test changes
   ```

3. **If something breaks**:
   ```bash
   cd ~/dotfiles && ./install.sh  # Restore last working config
   hyprctl reload
   ```

### Git Repository
- **Repo**: `~/dotfiles` (already initialized and connected to GitHub)
- **Backup command**: `./quick-commands.sh backup` (commits + pushes)
- **Restore command**: `./install.sh` (restores from repo)

## Current Issues to Solve
- [ ] Wallpaper management (hyprpaper issues, considering swww)
- [ ] Pywal integration for auto-color schemes
- [ ] Bottom dock setup (nwg-dock-hyprland planned but not implemented)
- [ ] More advanced waybar customization
- [ ] Application theming consistency

## What I'm Open To
- **Color scheme improvements** (keeping purple/blue base) or a color scheme switching system
- **Better animations** and visual effects
- **Productivity enhancements** for coding/pentesting
- **Modern ricing trends** (2025 aesthetic)
- **Performance optimizations**
- **Cool widgets** or status bar modules

## What I Want to Avoid
- Breaking the current working dual-monitor setup
- Losing the smooth window effects I like
- Complex configs that are hard to maintain
- Anything that hurts gaming performance
- Light themes or bright colors

## Key Keybinds Currently Set
- `Super + Q` - Terminal
- `Super + R` - App launcher  
- `Super + C` - Close window
- `Super + F` - Fullscreen
- `Super + V` - Toggle floating
- `Super + 1-9` - Workspaces
- `Super + Shift + =/-` - Scale laptop monitor
- `Print` - Screenshot selection
- `Super + L` - Lock screen

## Applications I Use Regularly
- **Development**: VS Code, terminals, git
- **Gaming**: Steam 
- **Daily**: Firefox, file manager, Discord
- **Media**: mpv, Spotify, youtubemusic

## Goals for This Session
Please help me with [specific task here], keeping in mind:
- Maintain the cyberpunk/purple aesthetic
- Follow the backup/restore workflow
- Test changes incrementally
- Explain what you're changing and why
- Provide rollback instructions if something goes wrong

---

**Remember**: Always backup before changes, test incrementally, and maintain the aesthetic we've built!
