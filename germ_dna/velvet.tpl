#!/bin/bash -login
#PBS -l walltime={{time}}
#PBS -l nodes=1:ppn={{n_threads}}
#PBS -l mem={{mem}}
#PBS -A ged

cd $PBS_O_WORKDIR

module load velvet

export OMP_NUM_THREADS={{n_threads}}

velveth {{directory}} {{k_start}},{{k_end}},{{k_step}} -fastq -shortPaired {% for fn in file_list %} {{fn}} {% endfor %}
velvetg {{directory}} -min_contig_lgth {{min_contig_lgth}} -cov_cutoff {{cov_cutoff}} -exp_cov {{exp_cov}} -ins_length {{ins_length}} -read_trkg yes -amos_file yes -max_gap_count {{max_gap_count}} -min_pair_count {{min_pair_count}}
