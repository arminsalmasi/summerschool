program basic
  use mpi
  use iso_fortran_env, only : REAL64

  implicit none
  integer, parameter :: size = 100
  integer :: rc, myid, ntasks, count
  integer :: status(MPI_STATUS_SIZE)
  integer :: message(size)
  integer :: receiveBuffer(size)

  real(REAL64) :: t0, t1 

  call mpi_init(rc)
  call mpi_comm_rank(MPI_COMM_WORLD, myid, rc)
  call mpi_comm_size(MPI_COMM_WORLD, ntasks, rc)

  message = myid

  ! Start measuring the time spent in communication
  call mpi_barrier(mpi_comm_world, rc)
  t0 = mpi_wtime()

  ! TODO: Send and receive as defined in the assignment
  if ( myid < ntasks-1 ) then
     call mpi_sendrecv(message, size, MPI_INTEGER, myid+1, myid+1, &
      receiveBuffer, size, MPI_INTEGER, myid+1, myid, MPI_COMM_WORLD, status, rc)
     write(*,'(A10,I3,A20,I8,A,I3,A,I3)') 'Sender: ', myid, &
          ' Sent elements: ',size, &
          '. Tag: ', myid+1, '. Receiver: ', myid+1

     write(*,*) 'data received' ,myid+1
     call MPI_Get_count(status, MPI_integer, count,rc)
     write(*,*) count 
  end if

  if (myid == ntasks) then
     call mpi_sendrecv(message, size, MPI_INTEGER, MPI_PROC_NULL, myid+1, &
      receiveBuffer, size, MPI_INTEGER, MPI_PROC_NULL, myid, MPI_COMM_WORLD, status, rc)
     write(*,'(A10,I3,A20,I8,A,I3,A,I3)') 'Sender: ', myid, &
          ' Sent elements: ',size, &
          '. Tag: ', myid, '. Receiver: ', 'null'
     write(*,*) 'data received' ,myid
    call MPI_Get_count(status, MPI_integer, count,rc)
     write(*,*) count 
  end if

  if ( myid > 0 ) then

     call mpi_sendrecv(message,size, MPI_INTEGER, myid-1, myid-1, &
      receiveBuffer,size, MPI_INTEGER, myid-1, myid, MPI_COMM_WORLD, status, rc)

     write(*,'(A10,I3,A,I3)') 'Receiver: ', myid, &
          ' First element: ', receiveBuffer(1)
     write(*,*) 'data received' ,myid
     call MPI_Get_count(status, MPI_integer, count,rc)
     write(*,*) count 
  end if



  ! 0 side 
  if (myid == 0) then

     call mpi_sendrecv(message,size, MPI_INTEGER, myid, myid, &
      receiveBuffer,size, MPI_INTEGER, MPI_PROC_NULL, myid, MPI_COMM_WORLD, status, rc)

      write(*,'(A10,I3,A,I3)') 'Receiver: ', myid, &
           ' First element: ', receiveBuffer(1)
      write(*,*) 'data received', myid
     call MPI_Get_count(status, MPI_integer, count,rc)
     write(*,*) count 
     
  end if

  


  ! Finalize measuring the time and print it out
  t1 = mpi_wtime()
  call mpi_barrier(mpi_comm_world, rc)
  call flush(6)

  write(*, '(A20, I3, A, F6.3)') 'Time elapsed in rank', myid, ':', t1-t0

  call mpi_finalize(rc)

end program basic
