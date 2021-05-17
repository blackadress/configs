#! /bin/bash

PID=$(pidof fcitx5)
if [ -z "$PID" ]
then
        tmux
else
        kill $PID && tmux
fi
