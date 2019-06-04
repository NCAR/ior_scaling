# ior_scaling

IOR-based I/O scaling study

This study uses the [NCAR/ior](https://github.com/NCAR/ior) fork on GitHub.

The study performs IOR runs for 6 APIs, with the following command-line options:

| **API**      | **COMMAND**                                                                             |
|--------------|-----------------------------------------------------------------------------------------|
| **POSIX:**   | `mpirun -n N ior -a POSIX -b B -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 12 -t T`    |
| **MPIIO:**   | `mpirun -n N ior -a MPIIO -b B -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 12 -t T`    |
| **NetCDF4:** | `mpirun -n N ior -a NC4 -b B -c -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 12 -t T`   |
| **PnetCDF:** | `mpirun -n N ior -a NCMPI -b B -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 12 -t T`    |
| **HDF5:**    | `mpirun -n N ior -a MPIIO -b B -c -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 12 -t T` |
| **Z5:**      | `mpirun -n N ior -a Z5 -b B -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 12 -t T`       |

For the parameters:

| **PARAMETER** | **MEANING** |
|---------------|-------------|
| N             | Number of MPI processes (number of individual chunks if B=T) |
| B             | IOR block size (multiple of T, representing number of chunks per process) |
| T             | IOR transfer size (chunk size) |
