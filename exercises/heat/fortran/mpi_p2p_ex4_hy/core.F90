! Main solver routines for heat equation solver
module core
    use heat

contains

  ! Exchange the boundary data between MPI tasks
  subroutine exchange(field0, parallel, omp_num)
    use mpi

    implicit none

    type(field), intent(inout) :: field0
    type(parallel_data), intent(in) :: parallel
      
    integer :: status(MPI_STATUS_SIZE)
    integer :: ierr, req10,req11,req12,req13, omp_num, omp_num2
    real, allocatable :: msg(:,:)



    ! TODO start: implement halo exchange
    !##################################################################################
    ! Send to left, receive from right
     
      call mpi_sendrecv(field0%data(0,1),field0%nx+2,&
      MPI_DOUBLE_PRECISION, parallel%nleft,omp_num,field0%data(0,field0%ny+1),field0%nx+2,&
      MPI_DOUBLE_PRECISION, parallel%nright,omp_num,MPI_COMM_WORLD, MPI_STATUS_IGNORE, ierr)
        
    ! Send to right, receive from left
      omp_num2= omp_num + 2**10
      call mpi_sendrecv(field0%data(0,field0%ny),field0%nx+2,&
      MPI_DOUBLE_PRECISION, parallel%nright,omp_num2,field0%data(0,0),field0%nx+2, &
      MPI_DOUBLE_PRECISION, parallel%nleft, omp_num2,MPI_COMM_WORLD, MPI_STATUS_IGNORE, ierr)
       
    !###################################################################################
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
    !###################################################################
    !$omp parallel do private(i) 
      do j = 1, ny
         do i = 1, nx
            curr%data(i, j) = prev%data(i, j) + a * dt * &
                & ((prev%data(i-1, j) - 2.0 * prev%data(i, j) + &
                &   prev%data(i+1, j)) / curr%dx**2 + &
                &  (prev%data(i, j-1) - 2.0 * prev%data(i, j) + &
                &   prev%data(i, j+1)) / curr%dy**2)
         end do
      end do

    !$omp end parallel do

    !##################################################################
  end subroutine evolve

end module core
