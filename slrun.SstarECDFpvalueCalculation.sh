#!/bin/bash
#SBATCH --get-user-env
#SBATCH --mem=70G
#SBATCH --qos=1day
#SBATCH --time=22:00:00
#SBATCH --output=/scratch/tmp/abwolf/Sstar/test/slrun.SstarECDFpvalueCalculation.%A_%a.o
source ~/.bashrc

date
echo $SLURM_JOB_NAME
echo $SLURM_ARRAY_TASK_ID
echo ''

sstardir=~/SimulatedDemographic/Sstar/

cmd=$( echo " Rscript $sstardir/bin/SstarECDFpvalueCalculation.R \n
	--inputdir /Genomics/akeylab/abwolf/SimulatedDemographic/Sstar/test/multi_sample/Tenn/ \n
	--outputdir /Genomics/akeylab/abwolf/SimulatedDemographic/Sstar/test/multi_sample/Tenn/n1_0.05_n2_0.0/bedfiles/  \n
	--mdl Tenn_nonAfr \n
	--null_dir /null/ \n
	--null_tag n1_0.0_n2_0.0 \n
	--admix_dir /n1_0.05_n2_0.0/ \n
	--admix_tag n1_0.05_n2_0.0 \n
	--max_chrm_admix $SLURM_ARRAY_TASK_ID \n
	--max_chrm_null 5000 \n
	--filter " )

echo -e $cmd

eval $( echo -e $cmd )

echo FIN
date