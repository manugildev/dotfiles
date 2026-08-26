#!/usr/bin/env bash
# macOS system settings. Run once on a new machine.
# Only settings that differ from macOS defaults are listed here.
# Changes take effect after re-login or: killall Dock Finder SystemUIServer

set -e

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true           # default: false
defaults write com.apple.finder ShowPathbar -bool true                 # default: false
defaults write com.apple.finder ShowStatusBar -bool true               # default: false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"   # default: icnv (icons)
defaults write com.apple.finder _FXSortFoldersFirst -bool true         # default: false
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true
defaults write com.apple.finder NewWindowTarget -string "PfHm"        # default: PfDe (Desktop)
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"

# Dock
defaults write com.apple.dock autohide -bool true                      # default: false
defaults write com.apple.dock launchanim -bool false                   # default: true
defaults write com.apple.dock expose-animation-duration -float 0.1    # default: 0.5
defaults write com.apple.dock mru-spaces -bool false                   # default: true
defaults write com.apple.dock show-recents -bool false                 # default: true

# Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true   # default: false (tap to click off)

# Scroll direction: non-natural (traditional)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false  # default: true (natural)

# Keyboard
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false     # default: true (accent picker)

# Global UI
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"       # default: not set (Light)

# Apply
killall Dock Finder 2>/dev/null || true

echo "Done. Re-login for all changes to take full effect."
