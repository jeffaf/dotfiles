#!/bin/bash
# Setup GitHub repository

echo "🐙 Setting up GitHub repository..."

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Installing GitHub CLI..."
    sudo pacman -S github-cli
fi

# Login to GitHub
echo "Please login to GitHub:"
gh auth login

# Create repository
echo "Creating GitHub repository..."
gh repo create dotfiles --public --description "My Hyprland dotfiles" --clone=false

# Add remote and push
git remote add origin https://github.com/$(gh api user --jq .login)/dotfiles.git
git add .
git commit -m "Initial dotfiles commit 🎨"
git push -u origin main

echo "✅ GitHub repository created!"
echo "🌐 Repository URL: https://github.com/$(gh api user --jq .login)/dotfiles"
