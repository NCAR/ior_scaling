# ior_scaling

IOR-based I/O scaling study

This study uses the [NCAR/ior](https://github.com/NCAR/ior) fork on GitHub.

The study performs IOR runs for 6 APIs, with the following command-line options:

| **API**      | **COMMAND**                                                                                            |
|--------------|--------------------------------------------------------------------------------------------------------|
| **POSIX:**   | `mpirun -n N ior -a POSIX -b $(( M * T ))    -C -d 1 -e -F -g -i 10 -o OUTPATH -r -s 12 -t T -v -w -Z` |
| **Z5:**      | `mpirun -n N ior -a Z5    -b $(( M * T ))    -C -d 1 -e -F -g -i 10 -o OUTPATH -r -s 12 -t T -v -w -Z` |
| **MPIIO:**   | `mpirun -n N ior -a MPIIO -b $(( M * T )) -c -C -d 1       -g -i 10 -o OUTPATH -r -s 12 -t T -v -w -Z` |
| **HDF5:**    | `mpirun -n N ior -a HDF5  -b $(( M * T )) -c -C -d 1       -g -i 10 -o OUTPATH -r -s 12 -t T -v -w -Z` |
| **NetCDF4:** | `mpirun -n N ior -a NC4   -b $(( M * T )) -c -C -d 1       -g -i 10 -o OUTPATH -r -s 12 -t T -v -w -Z` |
| **PnetCDF:** | `mpirun -n N ior -a NCMPI -b $(( M * T ))    -C -d 1       -g -i 10 -o OUTPATH -r -s 12 -t T -v -w -Z` |

For the parameters:

| **PARAMETER** | **MEANING**        |
|---------------|--------------------|
| N | Number of MPI processes        |
| M | Number of chunks per process   |
| T | IOR transfer size (chunk size) |

We will _assume 1 MPI process per compute node_.

The size of a _segment_ written by a single process should be **M * T**.

The total size of a _segment_ of the dataset should be **N * M * T**.

The total size of the entire dataset should be **N * M * T * 12**, since there are 12 segments.

## Weak Scaling Parameters

- **N**: 1, 2, 4, 8, *16, 32, 64*
- **M**: 1, 2, 4, 8, *16, 32, 64*
- **T**: 8M, 16M, 32M, 64M, 128M, 256M, 512M

All together, this is 7<sup>3</sup> = 343 separate IOR runs (for each API), _or 7<sup>2</sup> = 49
weak scaling studies for each API._  The _per-process segment size_ ranges from 8M to 32G.  And therefore
the _total segment size_ ranges from 8M to 2T.  Assuming 12 segments (akin to 1 year of monthly data),
the _total size_ will actually be 12x larger.

See the parameters notebook for more details.
