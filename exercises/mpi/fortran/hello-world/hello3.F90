  program hello
  use mpi
  !use omp
  implicit none

  integer :: rank, rc, numproc, prov, numt, tnum
  
  call mpi_init_thread(mpi_thread_funneled, prov, rc)
  

  call mpi_comm_rank(MPI_COMM_WORLD, rank, rc)
  !$omp parallel private(numt,tnum) 
    numt = omp_get_num_threads()
    tnum = omp_get_thread_num()
    print *, 'Hello world!' ,rank
    if (rank==0) then
      call MPI_COMM_SIZE(MPI_COMM_WORLD, numproc, rc)
      write(*,*) 'number of ranks',numproc, 'numt', numt, 'tnum', tnum
    endif
    !print *, 'X'
  
  !$omp end parallel
 
  call mpi_finalize(rc)

end program hello
