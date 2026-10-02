#!/usr/bin/env bash
# macOS system settings. Run once on a new machine.
# Only settings that differ from macOS defaults are listed here.
# Changes take effect after re-login or: killall Dock Finder SystemUIServer

set -e

# Language & region
defaults write NSGlobalDomain AppleLanguages -array "en-US"
defaults write NSGlobalDomain AppleLocale -string "en_US@rg=dkzzzz"   # English (US), region Denmark

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true           # default: false
defaults write com.apple.finder ShowPathbar -bool true                 # default: false
defaults write com.apple.finder ShowStatusBar -bool true               # default: false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"    # default: icnv (icons)
defaults write com.apple.finder _FXSortFoldersFirst -bool true         # default: false
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true
defaults write com.apple.finder NewWindowTarget -string "PfHm"        # default: PfDe (Desktop)
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"    # default: SCev (search This Mac)
defaults write com.apple.finder DisableAllAnimations -bool true        # default: false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true        # default: false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true  # no .DS_Store on network shares

# Dock & Mission Control
defaults write com.apple.dock autohide -bool true                      # default: false
defaults write com.apple.dock launchanim -bool false                   # default: true
defaults write com.apple.dock expose-animation-duration -float 0.1     # default: 0.5
defaults write com.apple.dock mru-spaces -bool false                   # default: true
defaults write com.apple.dock show-recents -bool false                 # default: true
defaults write com.apple.dock tilesize -int 41                         # default: 48
defaults write com.apple.dock expose-group-apps -bool true             # default: false (group windows by app, recommended by AeroSpace)

# Desktop & Stage Manager
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false  # default: true (click wallpaper to reveal desktop)
defaults write com.apple.WindowManager HideDesktop -bool true          # default: false (hide desktop items)

# Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true   # default: false (tap to click off)
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1  # tap to click (also on login screen)

# Scroll direction: non-natural (traditional)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false  # default: true (natural)

# Windows: ctrl+cmd+drag anywhere in a window to move it
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true   # default: false

# Keyboard
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false     # default: true (accent picker)

# Keyboard shortcuts (System Settings > Keyboard > Keyboard Shortcuts)
# Modifier masks: shift=131072 ctrl=262144 opt=524288 cmd=1048576 fn=8388608
disable_hotkey() {
  # $1 = hotkey ID, $2 $3 $4 = ascii, keycode, modifiers (kept so re-enabling restores the default combo)
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$1" \
    "<dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>$2</integer><integer>$3</integer><integer>$4</integer></array><key>type</key><string>standard</string></dict></dict>"
}
disable_hotkey 28 51 20 1179648        # Save picture of screen as file (shift+cmd+3) - using Shottr
disable_hotkey 30 52 21 1179648        # Save picture of selected area as file (shift+cmd+4) - using Shottr
disable_hotkey 32 65535 126 8650752    # Mission Control (ctrl+up)
disable_hotkey 33 65535 125 8650752    # Application windows (ctrl+down)
disable_hotkey 60 32 49 262144         # Select previous input source (ctrl+space)
disable_hotkey 61 32 49 786432         # Select next input source (ctrl+opt+space)
disable_hotkey 64 32 49 1048576        # Show Spotlight search (cmd+space) - using Raycast
disable_hotkey 79 65535 123 8650752    # Move left a space (ctrl+left) - using AeroSpace
disable_hotkey 81 65535 124 8650752    # Move right a space (ctrl+right) - using AeroSpace

# Services shortcuts (Keyboard Shortcuts > Services)
defaults write pbs NSServicesStatus -dict-add \
  '"com.apple.Terminal - New Terminal at Folder - newTerminalAtFolder"' \
  '{ key_equivalent = "@$c"; }'        # shift+cmd+c
defaults write pbs NSServicesStatus -dict-add \
  '"com.apple.Terminal - New Terminal Tab at Folder - newTerminalAtFolder"' \
  '{ enabled_context_menu = 0; enabled_services_menu = 0; presentation_modes = { ContextMenu = 0; ServicesMenu = 0; }; }'

# Menu bar (18 = always show)
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18
defaults -currentHost write com.apple.controlcenter Sound -int 18      # default: show when active
defaults -currentHost write com.apple.controlcenter UserSwitcher -int 18
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Screenshots / recordings
defaults write com.apple.screencapture showsClicks -bool true          # default: false (show clicks in recordings)

# Global UI
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"       # default: not set (Light)
defaults write NSGlobalDomain AppleAccentColor -int 3                  # Green (default: not set, multicolor)
defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"
defaults write NSGlobalDomain AppleReduceDesktopTinting -bool true     # default: false (wallpaper tinting in windows)
defaults write NSGlobalDomain UIPreferredContentSizeCategoryName -string "UICTContentSizeCategoryXL"  # text size: larger
# universalaccess is TCC protected; needs Full Disk Access for the terminal
defaults write com.apple.universalaccess FontSizeCategory -dict global L version "3.0" 2>/dev/null || true

# Terminal.app
defaults write com.apple.Terminal SecureKeyboardEntry -bool true       # default: false

# Apply
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u 2>/dev/null || true
killall Dock Finder SystemUIServer ControlCenter 2>/dev/null || true

echo "Done. Re-login for all changes to take full effect."
