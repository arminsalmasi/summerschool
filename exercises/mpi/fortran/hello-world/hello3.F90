  program hello
  use mpi
  implicit none

  integer :: rank, rc, numproc
  call mpi_init_thread(rc)
  call mpi_comm_rank(MPI_COMM_WORLD, rank, rc)

  print *, 'Hello world!' ,rank
  if (rank==0) then
     call MPI_COMM_SIZE(MPI_COMM_WORLD, numproc, rc)
     write(*,*) 'number of ranks',numproc
  endif
  print *, 'X'
  call mpi_finalize(rc)

end program hello
