program exchange
  use mpi
  implicit none
  integer, parameter :: size = 100000
  integer :: rc, myid, ntasks, count
  integer :: status(MPI_STATUS_SIZE)
  integer:: message(size)
  integer:: receiveBuffer(size)

  call mpi_init(rc)
  call mpi_comm_rank(MPI_COMM_WORLD, myid, rc)
  call mpi_comm_size(MPI_COMM_WORLD, ntasks, rc)

  write(*,*) 'myid' , myid
  
  message = myid

  ! TODO: Implement sending and receiving as defined in the assignment
  if ( myid == 0 ) then

     
     write(*,*) 'i am 0 sending to 1 tag is 0'
     call mpi_send(message, size, MPI_INTEGER, 1, 0,MPI_COMM_WORLD,rc)
      write(*,*) 'i am 0 rec from 1 tag is 1'
     call mpi_recv(receivebuffer, size, MPI_INTEGER,1 , 1,MPI_COMM_WORLD,status,rc)

     write(*,'(A10,I3,A10,I3)') 'Rank: ', myid, &
          ' received ', receiveBuffer(1)
  else if (myid == 1) then

     !message(:)=myid
       write(*,*) 'i am 1 rec from 0 tag is 0'
     call mpi_recv(receivebuffer, size, MPI_INTEGER, 0, 0, MPI_COMM_WORLD,status,rc)
       write(*,*) 'i am 1 sending to 0 tag is 1 '

     call mpi_send(message, size, MPI_INTEGER,0, 1,MPI_COMM_WORLD,rc)

     write(*,'(A10,I3,A10,I3)') 'Rank: ', myid, &
          ' received ', receiveBuffer(1)
  end if

  call mpi_finalize(rc)

end program exchange
