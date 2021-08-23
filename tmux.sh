#!/bin/sh

####
## Pi64
## https://github.com/nickbild/pi-64
## Nick Bild
## August 2021
####

# Create a new session for 1920x1024 resolution.
tmux new-session -d -x 240 -y 66

# Create all panes.
#
# Layout looks like this:
#
# --------------------
# --       p0       --
# --------------------
# -- p1 -- p2 -- p3 --
# --------------------
# -- p4 -- p5 -- p6 --
# --------------------
#
# p2 is the visible pane.  The rest are to take up space and be replaced by the border.
#
tmux split-window -v
tmux split-window -h
tmux split-window -h
tmux select-pane -t 0
tmux split-window -v
tmux split-window -h    # This is the visible pane (p2).
tmux split-window -h

# Resize the panes.
# This makes the border and visible region appropriately sized.
tmux resize-pane -t 0 -x 240 -y 4

tmux resize-pane -t 1 -x 7 -y 57
tmux resize-pane -t 2 -x 224 -y 57
tmux resize-pane -t 3 -x 7 -y 57

tmux resize-pane -t 4 -x 7 -y 3
tmux resize-pane -t 5 -x 224 -y 3
tmux resize-pane -t 6 -x 7 -y 3

# Set the visible pane as selected/active.
tmux select-pane -t 2

# Attach to the newly created session.
tmux -2 attach-session -d
