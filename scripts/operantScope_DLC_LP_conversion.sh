#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=0-01:30:00 
#SBATCH --job-name=operantScope_DLC_LP_conversion
#SBATCH --mem=50GB 
#SBATCH --ntasks=1



source ~/miniconda3/etc/profile.d/conda.sh
conda activate pose_estimation
python /home/nfh2911/Documents/Experiments_Operant/lightning-pose/scripts/converters/dlc2lp.py --dlc_dir="/mnt/fsmresfiles/Operant_Data/videos/DeepLabCut/projects/OperantScope-CC-2024-02-19_toLP" --lp_dir="/home/nfh2911/Documents/Experiments_Operant/OperantScope_LP"

