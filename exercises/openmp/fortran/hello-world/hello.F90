program hello
  use omp_lib
  implicit none
  integer :: a,b

  print *, 'Hello world!'
  !$omp parallel
  a = omp_get_num_threads()
  b = omp_get_thread_num()
  write(*,*) 'num_trheads : ',a
  write(*,*) 'threads_num : ',b
  print *, 'X'
  !$omp end parallel

end program hello
