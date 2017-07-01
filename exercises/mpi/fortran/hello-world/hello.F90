program hello
  use mpi
  implicit none

  integer :: rank, rc
  call mpi_init()
  call mpi_comm_rank(MPI_COMM_WORLD, rank, rc)
  print *, 'Hello world!' ,rank
  
  print *, 'X'
  cal mpi_finalize

end program hello
