program pario
  use mpi
  use, intrinsic :: iso_fortran_env, only : error_unit, output_unit
  implicit none

  integer, parameter :: datasize = 64, writer_id = 0
  integer :: rc, my_id, ntasks, localsize, i, fhadle, disp, status(MPI_SATATUS_SIZE)
  integer, dimension(:), allocatable :: localvector
  integer, dimension(datasize) :: fullvector

  call mpi_init(rc)
  call mpi_comm_size(mpi_comm_world, ntasks, rc)
  call mpi_comm_rank(mpi_comm_world, my_id, rc)

  if (ntasks > 64) then
    write(error_unit, *) 'Maximum number of tasks is 64!'
    call mpi_abort(MPI_COMM_WORLD, -1, rc)
  end if

  if (mod(datasize, ntasks) /= 0) then
    write(error_unit,*) 'Datasize (64) should be divisible by number of tasks'
    call mpi_abort(MPI_COMM_WORLD, -1, rc)
  end if

  localsize = datasize / ntasks
  allocate(localvector(localsize))

  localvector = [(i + my_id * localsize, i=1,localsize)]
  call multiple_writer()
  call single_writer()

  deallocate(localvector)
  call mpi_finalize(rc)
  
contains

  subroutine single_writer()!fullvector, localvector, datasize,localsize)
    implicit none
    !integer :: datasize,localsize
    !integer :: localvector(localsize)
    !integer :: fullvector(datasize)
           
    ! TODO: Implement a function that writers the whole array of elements
    !       to a file so that single process is responsible for the file io
         call mpi_gather(localvector, localsize, mpi_integer, fullvector, &
                          localsize,mpi_integer,writer_id,mpi_comm_world,rc)
         if (my_id== writer_id) then
           call MPI_FILE_OPEN(MPI_COMM_WORLD,'out.dat', MPI_MODE_RDWR,MPI_INFO_NULL, fhandle,ierror)
           disp = my_id * size(fullvector)
           call MPI_FILE_WRITE_AT(fhandle,disp, fullvector, disp, MPI_INTEGER,status,ierror)
           call MPI_FILE_CLOSE(fhadle,ierror) 
          endif       
  end subroutine single_writer
     

end program pario
