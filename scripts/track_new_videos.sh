#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=0-02:00:00
#SBATCH --job-name=track_new_videos
#SBATCH --mem=20GB
#SBATCH --ntasks=1
#SBATCH --nodelist=FSM2JSX7Y3

source ~/miniconda3/etc/profile.d/conda.sh

conda activate pose_estimation 

python scripts/predict_new_vids.py --config-path="/home/nfh2911/Documents/Experiments_Operant/OperantScope_LP" --config-name="config_default.yaml" eval.hydra_paths=["2024-03-04/12-57-49"] eval.test_videos_directory="/mnt/fsmresfiles/Operant_Data/videos/lightning_pose/" eval.saved_vid_preds_dir="/mnt/fsmresfiles/Operant_Data/videos/lightning_pose/preds/"
