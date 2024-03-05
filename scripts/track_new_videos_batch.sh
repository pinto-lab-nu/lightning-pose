#!/bin/env bash

basename = "mnt/fsmresfiles/Operant_Data/imaging/DMS_imaging"

recs="mnt/fsmresfiles/Operant_Data/imaging/DMS_imaging/IM7/2024_02_09/15_05_50/My_WebCam
"

for recname in $recs
do
    echo $recname
	sbatch /home/nfh2911/Documents/Experiments_Operant/lightning-pose/scripts/track_new_videos.sh $recname
	sleep 1
done


