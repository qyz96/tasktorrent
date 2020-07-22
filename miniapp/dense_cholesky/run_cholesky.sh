#!/bin/bash
#SBATCH -o ttor_chol_%j.out

hostname
lscpu

mpirun -n ${SLURM_NTASKS} hostname

echo ${KIND}
echo ${RANDOM_SIZES}

# ./cholesky block_size num_blocks n_threads verb nprows npcols kind log depslog test accumulate random_sizes
OMP_NUM_THREADS=1 mpirun -n ${SLURM_NTASKS} ./cholesky ${BLOCK_SIZE} ${NUM_BLOCKS} ${N_THREADS} 0 ${NPROWS} ${NPCOLS} ${KIND} 0 0 0 0 ${RANDOM_SIZES}
