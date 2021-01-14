#!/bin/sh

# Set Session Name
SESSION="Renderer"
WORKPATH="~/Personal/rust/wgpu-renderer"
SESSIONEXISTS=$(sudo tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Pane and start zsh
    tmux rename-window -t $SESSION:0 'IDE'
    tmux send-keys -t 'IDE' 'cd '$WORKPATH C-m
    tmux send-keys -t 'IDE' 'nvim src/main.rs' C-m
    tmux send-keys -t 'IDE' ':NERDTree' C-m
    tmux split-window -t "IDE"
    tmux resize-pane -y 10
    tmux send-keys -t "IDE" 'cd '$WORKPATH C-m 'clear' C-m
    tmux send-keys -t "IDE" 'sudo cargo watch -q -x "check --message-format short"' C-m


    # Create and setup pane for hugo server
    tmux new-window -t $SESSION:1 -n 'TERMINAL'
    tmux send-keys -t "TERMINAL" 'cd '$WORKPATH C-m 'clear' C-m
    tmux send-keys -t "TERMINAL" 'git status' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
