# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# General Aliases
alias start-rust-ide="~/.config/tmux/start_session.sh"
alias python="python3.8"

# General Exports 
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export MYVIMRC="~/.config/nvim/init.vim"

# Rust Lang Support
export PATH="$PATH:$HOME/.cargo/bin"
. "$HOME/.cargo/env"
