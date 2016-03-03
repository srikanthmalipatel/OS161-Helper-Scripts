#!/bin/bash


SESSION="gdb"

# if a session alread exists then kill it and open a new session
tmux has-session -t $SESSION
if [ $? == 0 ]
then
	tmux kill-session -t $SESSION
	echo "Session removed"
else
	echo "No such session exists"
fi

