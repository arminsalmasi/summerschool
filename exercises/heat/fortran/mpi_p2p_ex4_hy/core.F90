! Main solver routines for heat equation solver
module core
    use heat

contains

  ! Exchange the boundary data between MPI tasks
  subroutine exchange(field0, parallel)
    use mpi

    implicit none

    type(field), intent(inout) :: field0
    type(parallel_data), intent(in) :: parallel
      
    integer :: status(MPI_STATUS_SIZE)
    integer :: ierr, req10,req11,req12,req13
    real, allocatable :: msg(:,:)



    ! TODO start: implement halo exchange
    !##################################################################################
    ! task sendrecv
       
    ! Send to left, receive from right
     
      !call mpi_sendrecv(field0%data(0,1),field0%nx+2,&
      !MPI_DOUBLE_PRECISION, parallel%nleft,10,field0%data(0,field0%ny+1),field0%nx+2,&
      !MPI_DOUBLE_PRECISION, parallel%nright,10,MPI_COMM_WORLD, MPI_STATUS_IGNORE, ierr)
        
    ! Send to right, receive from left

      !call mpi_sendrecv(field0%data(0,field0%ny),field0%nx+2,&
      !MPI_DOUBLE_PRECISION, parallel%nright,11,field0%data(0,0),field0%nx+2, &
      !MPI_DOUBLE_PRECISION, parallel%nleft, 11,MPI_COMM_WORLD, MPI_STATUS_IGNORE, ierr)
       
    !###################################################################################
    ! task isen irec
    
    ! Send to left, receive from right
      
      call mpi_isend(field0%data(0,1),field0%nx+2,MPI_DOUBLE_PRECISION,&
                     parallel%nleft,10,MPI_COMM_WORLD,req10,ierr)
      call mpi_irecv(field0%data(0,field0%ny+1),field0%nx+2,MPI_DOUBLE_PRECISION,&
                     parallel%nright,10,MPI_COMM_WORLD,req11, ierr)

    ! Send to right, receive from left
      
      call mpi_isend(field0%data(0,field0%ny),field0%nx+2,MPI_DOUBLE_PRECISION,&
                     parallel%nright,11,MPI_COMM_WORLD,req12,ierr)
      call mpi_irecv(field0%data(0,0),field0%nx+2,MPI_DOUBLE_PRECISION,&
                     parallel%nleft,11,MPI_COMM_WORLD,req13,ierr)
      


      call mpi_waitall(4, (/req10,req11,req12,req13/), status)
    !##################################################################################

          
         
    ! TODO end

  end subroutine exchange

  ! Compute one time step of temperature evolution
  ! Arguments:
  !   curr (type(field)): current temperature values
  !   prev (type(field)): values from previous time step
  !   a (real(dp)): update equation constant
  !   dt (real(dp)): time step value
  subroutine evolve(curr, prev, a, dt)

    implicit none

    type(field), intent(inout) :: curr, prev
    real(dp) :: a, dt
    integer :: i, j, nx, ny

    nx = curr%nx
    ny = curr%ny

    !!!!!$omp parallel do     
      do j = 1, ny
         do i = 1, nx
            curr%data(i, j) = prev%data(i, j) + a * dt * &
                & ((prev%data(i-1, j) - 2.0 * prev%data(i, j) + &
                &   prev%data(i+1, j)) / curr%dx**2 + &
                &  (prev%data(i, j-1) - 2.0 * prev%data(i, j) + &
                &   prev%data(i, j+1)) / curr%dy**2)
         end do
      end do
    !!!!!!$omp end parallel do
  end subroutine evolve

end module core
