program vectorsum
use omp_lib  
  implicit none
  integer, parameter :: rk = kind(1d0)
  integer, parameter :: ik = selected_int_kind(9)
  integer, parameter :: nx = 102400

  real(kind=rk), dimension(nx) :: vecA, vecB, vecC
  real(kind=rk)    :: sum , starttime, endtime
  integer(kind=ik) :: i

  ! Initialization of vectors
  do i = 1, nx
     vecA(i) = 1.0_rk/(real(nx - i + 1, kind=rk))
     vecB(i) = vecA(i)**2
  end do

  starttime=omp_get_wtime()
  !$omp parallel do shared(vecA,vecB) PRIVATE(i)
  do i = 1 , size(vecA) 
     vecC(i) = vecA(i) ** vecB(i)
  enddo   
  ! Compute the check value
  !$omp end parallel do
  endtime=omp_get_wtime()
  write(*,*) 'Reduction sum: ', sum(vecC)
  write(*,*) 'time: ' , endtime-starttime
end program vectorsum
