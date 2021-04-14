#! /bin/bash

PID=$(pidof fcitx)
if [ -z "$PID" ]
then
        tmux
else
        kill $PID && tmux
fi
