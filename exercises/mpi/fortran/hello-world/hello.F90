program hello
  use mpi
  implicit none

  integer :: rank, rc
  call mpi_init(rc)
  call mpi_comm_rank(MPI_COMM_WORLD, rank, rc)
  print *, 'Hello world!' ,rank
  
  print *, 'X'
  call mpi_finalize(rc)

end program hello
