# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
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

# Custom location for $MYVIMRC
export MYVIMRC=~/.config/nvim/init.vim

# Rust Lang Support
source ~/.cargo/env

# Start IDE session
alias start-rust-ide='~/.config/tmux/start_session.sh'

# Python
alias python='python3.8'

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
. "$HOME/.cargo/env"


source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

export PATH="/Users/manuelgil/.local/share/solana/install/active_release/bin:$PATH"
