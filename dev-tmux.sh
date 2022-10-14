#!/usr/bin/env bash

tmux new-session
tmux new-window -n 'downloads ⤵️'
tmux send-keys 'cd ~/Downloads' C-m;
tmux new-window -n 'platform 🦄'
tmux send-keys 'cd ~/Code/platform' C-m;
tmux new-window -n 'notes 📝'
tmux send-keys 'cd ~/Code/notes' C-m;
tmux new-window -n 'experiments 🧪'
tmux send-keys 'cd ~/Code/experiments' C-m;
tmux new-window -n 'purple 🟣'
tmux send-keys 'cd ~/Code/platform' C-m;
tmux new-window -n 'ds1 🖲'
tmux send-keys 'cd ~/Code/dsx' C-m;
tmux new-window -n 'psql 🐘'
tmux send-keys 'cd ~/Code/platform' C-m;
tmux split-window -v
tmux -2 attach-session -d
