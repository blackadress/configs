#! /bin/bash

start="date +%s"

A=0
CLIPLENGTH=$2
DURATION="$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $1)"
DURATION=${DURATION%.*}

while [ $A -le $DURATION ]
do
        ffmpeg -ss $A -i $1 -t $CLIPLENGTH -c:v libx264 -c:a aac -qp 1 out-${A}.mp4;
        let "A=A+$CLIPLENGTH"
done

end="date +%s"
runtime=$((end-start))

echo "Nos demoramos $runtime"

aplay $HOME/Music/alarma/alarma_gor.wav
