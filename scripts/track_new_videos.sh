#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=0-01:00:00
#SBATCH --job-name=track_new_videos
#SBATCH --mem=10GB
#SBATCH --ntasks=1
#SBATCH --nodelist=FSM2JSX7Y3
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=julia.cox@northwestern.edu

source ~/miniconda3/etc/profile.d/conda.sh

conda activate pose_estimation 

python /home/nfh2911/Documents/Experiments_Operant/lightning-pose/scripts/convert_behav_video.py concat_behav_video "$1"

python /home/nfh2911/Documents/Experiments_Operant/lightning-pose/scripts/predict_new_vids.py --config-path="/home/nfh2911/Documents/Experiments_Operant/OperantScope_LP" --config-name="config_default.yaml" eval.hydra_paths=["2024-03-04/12-57-49"] eval.test_videos_directory="$1" eval.saved_vid_preds_dir="$1" eval.save_vids_after_training=true
