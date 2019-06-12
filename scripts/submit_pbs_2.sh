#!/bin/bash

ior_n32=$(qsub pbs/ior_n32.pbs)
echo "N=32 Job: $ior_n32"

ior_n64=$(qsub -W depend=afterany:$ior_n32 pbs/ior_n64.pbs)
echo "N=64 Job: $ior_n64"
