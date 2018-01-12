#!/bin/bash
tmux split-window -h
tmux split-window -v
tmux split-window -v
tmux resize-pane -t 1 -x 80 -y 12
tmux resize-pane -t 2 -x 80 -y 24
