#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=0-05:00:00 
#SBATCH --job-name=trainingLPModel_OperantScope
#SBATCH --mem=50GB 
#SBATCH --ntasks-per-node=4
#SBATCH --nodelist=FSM2JSX7Y3


source ~/miniconda3/etc/profile.d/conda.sh
conda activate pose_estimation
python /home/nfh2911/Documents/Experiments_Operant/lightning-pose/scripts/train_hydra.py --config-path="/home/nfh2911/Documents/Experiments_Operant/OperantScope_LP" --config-name="config_default.yaml"

