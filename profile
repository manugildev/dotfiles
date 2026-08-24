# ~/.profile: executed by sh/bash for login shells.
# Not read by bash if ~/.bash_profile exists, but kept for POSIX portability.

# Include .bashrc if running bash interactively
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Add ~/bin and ~/.local/bin to PATH if they exist
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi


# Added by Antigravity CLI installer
export PATH="/Users/manuel.gil/.local/bin:$PATH"
