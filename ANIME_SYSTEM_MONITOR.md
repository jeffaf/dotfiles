# Anime System Monitor Widget - Documentation

## Overview
A beautiful cyberpunk-themed system monitor widget built with eww (ElKowar's Wacky Widgets) that perfectly complements your Hyprland rice setup.

## Features
- **Japanese Text**: Uses katakana/hiragana for authentic anime aesthetic
- **Cyberpunk Styling**: Purple/blue gradients matching your theme colors
- **Real-time Monitoring**: CPU, RAM, disk usage, temperature, network status
- **Toggle Control**: Show/hide with keybind
- **Bottom-left Positioning**: Doesn't interfere with other windows
- **Smooth Animations**: Glowing effects and hover states

## Installation & Setup

### Dependencies
- `eww` (ElKowar's Wacky Widgets)
- `eww-systemd` (for auto-start)
- Hyprland window manager
- Iosevka Nerd Font

### Files Created
```
~/dotfiles/
├── eww/
│   ├── eww.yuck          # Widget configuration
│   └── eww.scss          # Cyberpunk styling
├── scripts/
│   └── toggle-system-monitor.sh   # Toggle script
└── ANIME_SYSTEM_MONITOR.md        # This documentation
```

### Hyprland Integration
Added to `~/dotfiles/hypr/hyprland.conf`:
```bash
# System monitor widget toggle
bind = $mainMod, S, exec, ~/dotfiles/scripts/toggle-system-monitor.sh
```

### Systemd Service
Enabled for auto-start:
```bash
systemctl --user enable eww.service
```

## Usage

### Keybind
- **Super + S**: Toggle widget on/off

### Widget Content
The widget displays:

#### Header Section
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
　　　　　　　　　システムモニター v2.0
　　　　　　　　　　SYSTEM MONITOR
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
［状態：ONLINE］
```

#### Time Panel
- Digital clock with glow effect
- Current date and system uptime

#### System Vitals
- **CPU**: Real-time usage with blue/purple gradient bar
- **RAM**: Memory usage with purple/pink gradient bar  
- **TEMP**: CPU temperature display
- **DISK**: Storage usage with green/blue gradient bar

#### Status Footer
```
◆ システムは正常です - All systems operational
［(◕‿◕)］ すべて順調です
```

## Japanese Text Translations
- **システムモニター** (shisutemu monitā) = "System Monitor"
- **状態** (jōtai) = "Status/State"  
- **システムは正常です** (shisutemu wa seijō desu) = "System is normal/functioning properly"
- **すべて順調です** (subete junchō desu) = "Everything is going smoothly"

## Color Scheme
Matches your existing cyberpunk theme:
- **Primary Purple**: #bb9af7
- **Secondary Blue**: #89b4fa  
- **Accent Blue**: #7dcfff
- **Background**: rgba(26, 27, 38, 0.98)
- **Text**: #f8f8f2
- **Success Green**: #9ece6a

## Widget Positioning
- **Location**: Bottom-left corner
- **Offset**: 20px from left and bottom edges
- **Size**: 320px width × 420px height
- **Anchor**: bottom left
- **Layer**: overlay (above other windows)

## Technical Details

### Polling Configuration
- **CPU Usage**: Updates every 2 seconds
- **Memory Usage**: Updates every 2 seconds  
- **Temperature**: Updates every 3 seconds
- **Time**: Updates every 1 second
- **Network Status**: Updates every 5 seconds
- **Disk Usage**: Updates every 10 seconds

### CSS Features
- Linear gradients for depth
- Text shadows for glow effects
- Smooth transitions and hover states
- Progress bars with rounded corners
- Backdrop effects (where supported)

## Troubleshooting

### Widget Not Showing
```bash
# Check if eww daemon is running
eww active-windows

# Restart eww daemon
eww kill && eww daemon

# Open widget manually
eww open anime-system-monitor
```

### Toggle Not Working
```bash
# Test toggle script directly
~/dotfiles/scripts/toggle-system-monitor.sh

# Check Hyprland keybind
hyprctl binds | grep toggle-system-monitor
```

### Styling Issues
```bash
# Reload eww configuration
eww reload

# Check for CSS errors
eww logs
```

## Customization Ideas

### Possible Modifications
- Add more anime ASCII art
- Include network speed graphs
- Add workspace indicators
- Integrate with Spotify/music player
- Add weather information
- Create different themes/color schemes

### File Locations for Edits
- **Layout**: `~/dotfiles/eww/eww.yuck`
- **Styling**: `~/dotfiles/eww/eww.scss`  
- **Toggle Logic**: `~/dotfiles/scripts/toggle-system-monitor.sh`
- **Keybind**: `~/dotfiles/hypr/hyprland.conf`

## Backup & Recovery

### Current Setup Backed Up To
- **GitHub Repository**: https://github.com/jeffaf/dotfiles
- **Last Backup**: Commit 34ebb36
- **Backup Command**: `cd ~/dotfiles && ./quick-commands.sh backup`

### Restore From Backup
```bash
cd ~/dotfiles
git pull
./install.sh
systemctl --user enable eww.service
hyprctl reload
```

## Credits
- Built with eww by ElKowar
- Inspired by cyberpunk anime aesthetics  
- Integrated with existing Hyprland rice setup
- Color scheme matches TokyoNight theme variants

---

**Note**: This widget complements your existing Waybar setup and doesn't interfere with it. Both can run simultaneously for different purposes.