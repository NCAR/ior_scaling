#!/bin/bash

ior_n1=$(qsub pbs/ior_n1.pbs)
echo "N=1 Job: $ior_n1"

ior_n2=$(qsub -W depend=afterany:$ior_n1 pbs/ior_n2.pbs)
echo "N=2 Job: $ior_n2"

ior_n4=$(qsub -W depend=afterany:$ior_n2 pbs/ior_n4.pbs)
echo "N=4 Job: $ior_n4"

ior_n8=$(qsub -W depend=afterany:$ior_n4 pbs/ior_n8.pbs)
echo "N=8 Job: $ior_n8"

ior_n16=$(qsub -W depend=afterany:$ior_n8 pbs/ior_n16.pbs)
echo "N=16 Job: $ior_n16"
