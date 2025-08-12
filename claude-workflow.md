# Using Claude Code with Dotfiles

## Workflow for Config Changes

1. **Before making changes with Claude Code:**
   ```bash
   cd ~/dotfiles
   ./quick-commands.sh backup
   ```

2. **After Claude Code makes changes:**
   ```bash
   cd ~/dotfiles
   ./quick-commands.sh backup
   # Add descriptive commit message
   git commit --amend -m "Claude: Added XYZ feature to Hyprland config"
   git push --force-with-lease
   ```

3. **If you need to revert changes:**
   ```bash
   git log --oneline  # Find the commit to revert to
   git reset --hard <commit-hash>
   ./install.sh
   hyprctl reload
   ```

## Claude Code Commands

- `claude "backup my hyprland config changes"`
- `claude "help me add a new waybar module"`
- `claude "optimize my kitty terminal config"`
