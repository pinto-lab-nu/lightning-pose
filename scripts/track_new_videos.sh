#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=0-02:00:00
#SBATCH --job-name=track_new_videos
#SBATCH --mem=60GB
#SBATCH --ntasks-per-node=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=julia.cox@northwestern.edu
#SBATCH -o /mnt/fsmresfiles/Operant_Data/videos/lightning_pose/logs/%N.%j.out       # STDOUT
#SBATCH -e /mnt/fsmresfiles/Operant_Data/videos/lightning_pose/logs/%N.%j.err       # STDERR
#SBATCH --array=0-15%5

fname=($(</mnt/fsmresfiles/Operant_Data/videos/lightning_pose/videosToTrack.txt))


source ~/miniconda3/etc/profile.d/conda.sh

conda activate pose_estimation 

python /home/nfh2911/Documents/Experiments_Operant/lightning-pose/scripts/convert_behav_video.py "${fname[$SLURM_ARRAY_TASK_ID]}"

python /home/nfh2911/Documents/Experiments_Operant/lightning-pose/scripts/predict_new_vids.py --config-path="/home/nfh2911/Documents/Experiments_Operant/OperantScope_LP" --config-name="config_default.yaml" eval.hydra_paths=["/mnt/fsmresfiles/Operant_Data/videos/lightning_pose/outputs/2024-03-04/12-57-49"] data.image_resize_dims.height=128 data.image_resize_dims.width=256 eval.test_videos_directory="${fname[$SLURM_ARRAY_TASK_ID]}" eval.saved_vid_preds_dir="${fname[$SLURM_ARRAY_TASK_ID]}" eval.save_vids_after_training=false
