# ior_scaling

IOR-based I/O scaling study

This study uses the [NCAR/ior](https://github.com/NCAR/ior) fork on GitHub.

The study performs IOR runs for 6 APIs, with the following command-line options:

| **API**      | **COMMAND**                                                                                        |
|--------------|----------------------------------------------------------------------------------------------------|
| **POSIX:**   | `mpirun -n N ior -a POSIX -b $(( M * T )) -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 120 -t T`   |
| **MPIIO:**   | `mpirun -n N ior -a MPIIO -b $(( M * T )) -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 120 -t T`   |
| **NetCDF4:** | `mpirun -n N ior -a NC4 -b $(( M * T )) -c -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 120 -t T`  |
| **PnetCDF:** | `mpirun -n N ior -a NCMPI -b $(( M * T )) -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 120 -t T`   |
| **HDF5:**    | `mpirun -n N ior -a HDF5 -b $(( M * T )) -c -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 120 -t T` |
| **Z5:**      | `mpirun -n N ior -a Z5 -b $(( M * T )) -C -d 2 -e -F -g -i 10 -m -o OUTPATH -Q 1 -s 120 -t T`      |

For the parameters:

| **PARAMETER** | **MEANING**        |
|---------------|--------------------|
| N | Number of MPI processes        |
| M | Number of chunks per process   |
| T | IOR transfer size (chunk size) |

The total size of the dataset should be **N * M * T**.

The size of the data written by each process should be **M * T**.

## Weak Scaling Parameters

- **N**: 1, 2, 4, 8, *16, 32, 64*
- **M**: 1, 2, 4, 8, *16, 32, 64*
- **T**: 8M, 16M, 32M, 64M, 128M, 256M, 512M

All together, this is 7<sup>3</sup> = 343 separate IOR runs (for each API), _or 7<sup>2</sup> = 49
weak scaling studies for each API._  The _per-process data size_ ranges from 8M to 32G.  And therefore
the _total data size_ ranges from 8M to 2T.

See the parameters notebook for more details.
