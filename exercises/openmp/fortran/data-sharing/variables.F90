program exer1
  implicit none
  real :: var1, var2
  var1 = 1
  var2 = 2
  print *, 'Region 0:       var1=', var1, 'var2=', var2

  !!$omp parallel shared(var2,var1)
  !!$omp parallel private(var2,var1)  
  !$omp parallel private(var2) shared(var1)
 
  print *, 'Region 1:       var1=', var1, 'var2=', var2
  var1 = var1 + 1
  var2 = var2 + 1
  !$omp end parallel
  print *, 'After region 1: var1=', var1, 'var2=', var2
  print *

end program exer1
