#!/bin/sh
tmux new-session -d -x 240 -y 67
tmux split-window -v
tmux split-window -h
tmux split-window -h
tmux select-pane -t 0
tmux split-window -v
tmux split-window -h    # 'htop' Visible window.
tmux split-window -h

tmux resize-pane -t 0 -x 240 -y 3

tmux resize-pane -t 1 -x 4 -y 63
tmux resize-pane -t 2 -x 233 -y 63
tmux resize-pane -t 3 -x 3 -y 63

tmux resize-pane -t 4 -x 4 -y 1
tmux resize-pane -t 5 -x 233 -y 1
tmux resize-pane -t 6 -x 3 -y 1

tmux select-pane -t 2

tmux -2 attach-session -d
