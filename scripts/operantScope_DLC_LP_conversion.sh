#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=0-00:30:00 
#SBATCH --job-name=operantScope_DLC_LP_conversion
#SBATCH --mem=50GB 
#SBATCH --ntasks=1



conda activate pose_estimation
python /home/nfh2911/Documents/Experiments_Operant/lightning-pose/scripts/converters/dlc2lp.py --dlc_dir="/mnt/fsmresfiles/Operant_Data/videos/DeepLabCut/projects/OperantScope-CC-2024-02-19" --lp_dir="/home/nfh2911/Documents/Experiments_Operant/LP_projects"

