#!/bin/env bash

basename = "mnt/fsmresfiles/Operant_Data/imaging/DMS_imaging"

recs="IM7/2024_02_09/15_05_50/My_WebCam
"

for recname in $recs
do
    echo $recname
	sbatch track_new_videos.sh $basename $recname
	sleep 1
done


