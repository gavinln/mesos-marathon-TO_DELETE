#!/bin/bash

DIRNAME=`dirname $0`
export TERM=ansi
tmux new-session -d -s mesos "bash -i"
tmux split-window -p 50 -d "bash -i"
tmux select-pane -t 1
tmux attach-session -t mesos
