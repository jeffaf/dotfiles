#!/bin/bash
# Quick dotfiles management commands

case "$1" in
    "backup"|"save")
        ./backup.sh
        git add .
        git commit -m "Update configs $(date '+%Y-%m-%d %H:%M')"
        git push
        echo "✅ Configs backed up to GitHub!"
        ;;
    "install"|"restore")
        ./install.sh
        echo "✅ Configs restored!"
        ;;
    "status")
        git status
        ;;
    "push")
        git add .
        git commit -m "${2:-Update configs}"
        git push
        ;;
    "pull")
        git pull
        ./install.sh
        ;;
    *)
        echo "Dotfiles Manager"
        echo "Usage: $0 {backup|install|status|push|pull}"
        echo ""
        echo "  backup  - Save current configs and push to GitHub"
        echo "  install - Restore configs from repository"
        echo "  status  - Show git status"
        echo "  push    - Quick commit and push"
        echo "  pull    - Pull changes and install"
        ;;
esac
