program datatype2

  use mpi

  implicit none

  integer, dimension(8,8) :: array
  integer :: rank, ierr
  !TODO: declare variable for block datatype
      integer :: newtype
  integer, dimension(2) :: sizes, subsizes, offsets
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

  !TODO: create a datatype for a subblock [2:5][3:5] of the 8x8 matrix
  sizes(1) = 8 
  sizes(2) = 8
  subsizes(1) = 2
  subsizes(2) = 2
  offsets(1) = 3
  offsets(2) = 3
    call mpi_type_create_subarray(2, sizes, subsizes, offsets,&
          MPI_ORDER_FORTRAN, MPI_INTEGER, newtype, ierr)
    call mpi_type_commit(newtype, ierr)  


  !TODO: send a block of a matrix from rank 0 to rank 1
  
     select case (rank)
      case (0)
        call mpi_send(array, 1, newtype, 1, 1, MPI_COMM_WORLD,ierr)
      case(1)
        call mpi_recv(array, 1, newtype, 0, 1, MPI_COMM_WORLD, status,ierr)
    end select
  
  ! Print out the result
  if (rank == 1) then
     do i=1,8
        write(*,'(8I3)') array(i, :)
     end do
  end if
      
  !TODO: free mpi datatype	
      call mpi_type_free(newtype,ierr)
  call mpi_finalize(ierr)

end program datatype2
