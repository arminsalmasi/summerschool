program datatype1
  use mpi
  implicit none

  integer, dimension(8,8) :: array
  integer :: rank, ierr
  !TODO: declare variable for datatype
   integer :: newtype
   integer :: i, j
   integer :: status(MPI_STATUS_SIZE)
    
  call mpi_init(ierr)
  call mpi_comm_rank(MPI_COMM_WORLD, rank ,ierr)

  ! initialize arrays
  if (rank == 0) then
     do i=1,8
        do j=1,8
           array(i,j) = i*10 + j
        end do
     end do
  else
     array(:,:) = 0
  end if

  !TODO: create datatype describing one row, use mpi_type_vector
    call mpi_type_vector(12,2,4,MPI_INTEGER,newtype, ierr)
    call mpi_type_commit(newtype,ierr)
  !TODO: send first row of matrix from rank 0 to 1
  select case (rank)
  
     case (0) 
     call mpi_send(array, 1, newtype,1,1,MPI_COMM_WORLD,ierr)
    
     case(1)
     call mpi_recv(array, 1, newtype,0,1,MPI_COMM_WORLD, status, ierr)
   
  end select
  ! Print out the result
  if (rank == 1) then
     do i=1,8
        write(*,'(8I3)') array(i, :)
     end do
  end if

  !TODO free datatype

  call mpi_type_free(newtype,ierr)
  call mpi_finalize(ierr)

end program datatype1
