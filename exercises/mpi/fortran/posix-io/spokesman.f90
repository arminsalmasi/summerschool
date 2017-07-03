program pario
  use mpi
  use, intrinsic :: iso_fortran_env, only : error_unit, output_unit
  implicit none

  integer, parameter :: datasize = 64, writer_id = 0
  integer :: rc, my_id, ntasks, localsize, i
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
            open(10,file='out.dat', status='replace',form='unformatted', access='stream')
            write(10, pos=1) fullvector
            close(10)
            write(*,*) 'to the file: ', size(fullvector), 'elements' 
          endif       
  end subroutine single_writer
  

  subroutine multiple_writer()
     character(LEN=20) :: filenamest
     write(filenamest,"(A5,I1,A4)") 'out_',my_id,'.dat'
     filenamest=trim(filenamest)
     filenamest=adjustl(filenamest)
     write(*,*) filenamest
     open(11, file=filenamest, status='replace',form='unformatted',access='stream')
     write(11,pos=1) localvector 
     close(11)
     
  end subroutine multiple_writer

end program pario
