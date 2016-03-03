#!/bin/bash

cd ~/root
SESSION="gdb"

# if a session alread exists then kill it and open a new session
tmux has-session -t $SESSION
if [ $? == 0 ]
then
	echo "session already exists"
	tmux kill-session -t $SESSION
fi

tmux new-session -d -s $SESSION

# Setup window for debugging
tmux new-window -t $SESSION:1 -n "sys161-debug"
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "sys161 -w kernel" C-m
tmux select-pane -t 1 
tmux send-keys "os161-gdb -ex 'target remote unix:.sockets/gdb' kernel" C-m

#default window
tmux select-window -t $SESSION:1
tmux attach-session -t $SESSION
