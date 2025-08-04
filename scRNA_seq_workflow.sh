conda activate spipe


cd newvolume/expdata/Sub_library_1
## Sublibrary_1; concat R1 and R2 in different lanes
zcat Sub_library_1_CKDL230017038-1A*_L*_1* | gzip -c > S1_R1.fq.gz
zcat Sub_library_1_CKDL230017038-1A*_L*_2* | gzip -c > S1_R2.fq.gz


## Process sublibraries
split-pipe \
    --mode all \
    --chemistry v2 \
    --nthreads 12 \
    --genome_dir newvolume/genomes/hg38/ \
    --fq1 newvolume/expdata/Sub_library_1/S1_R1.fq.gz \
    --output_dir newvolume/analysis/S1-out \
    --samp_sltab newvolume/Hana_WT_mini.xlsm


cd newvolume/expdata/Sub_library_2
## Sublibrary_1; concat R1 and R2 in different lanes
zcat Sub_library_2_CKDL230017039-1A_*_L*_1.fq.gz | gzip -c > S2_R1.fq.gz
zcat Sub_library_2_CKDL230017039-1A_*_L*_2.fq.gz | gzip -c > S2_R2.fq.gz

split-pipe \
    --mode all \
    --chemistry v2 \
    --nthreads 12 \
    --genome_dir newvolume/genomes/hg38/ \
    --fq1 newvolume/expdata/Sub_library_2/S2_R1.fq.gz \
    --output_dir newvolume/analysis/S2-out \
    --samp_sltab newvolume/Hana_WT_mini.xlsm



    
## Combine sublibraries
split-pipe \
    --mode comb \
    --sublibraries newvolume/analysis/S1-out \
                   newvolume/analysis/S2-out \
    --output_dir newvolume/analysis/S_combined

######################
## New data batch 2 ##
######################

cd /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/expdata
# hpcf_interactive -n 12 -R "rusage[mem=8000]" -q standard
# conda activate codes/yes/envs/spipe

## sub.bsub.sh
#!/bin/bash
module load pigz
module load conda3/202210

cd /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/expdata/Sub_library_${NUM}

zcat Sub_library_${NUM}_*_1.fq.gz| pigz -p ${THREADS} > S${NUM}_R1.fq.gz
zcat Sub_library_${NUM}_*_*_2.fq.gz| pigz -p ${THREADS} > S${NUM}_R2.fq.gz

conda activate codes/yes/envs/spipe
split-pipe \
    --mode all \
    --chemistry v2 \
    --nthreads ${THREADS} \
    --genome_dir newvolume/genomes/hg38/ \
    --fq1 /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/expdata/Sub_library_${NUM}/S${NUM}_R1.fq.gz \
    --output_dir /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S${NUM}-out \
    --samp_sltab /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/WT_100K_Sample_Loading_Table.xlsm


split-pipe \
    --mode comb \
    --sublibraries /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S1-out \
                   /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S2-out \
                   /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S3-out \
                   /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S4-out \
                   /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S5-out \
                   /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S6-out \
                   /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S7-out \
                   /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S8-out \
    --output_dir /RNAseq/common/scRNAseq_Paul_cardiomyopathy_round2/newvolume/analysis/S_combined