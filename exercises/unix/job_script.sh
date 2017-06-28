#!/bin/bash
#SBATCH -J prog_Armin
#SBATCH -o %J.out
#SBATCH -e %J.err
#SBATCH -N 1
#SBATCH -ptest
#SBATCH -t 5
aprun -n 24 ./prog > log.log

