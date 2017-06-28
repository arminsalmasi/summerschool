module heattrans_dataStruc

Public
  
  integer :: nx, ny
  real :: dx, dy, bottomBC, topBC, leftBC, rightBC, midVal
  logical :: in_err, out_errq, out_err2
  

  type grid
     real, allocatable, save :: prevGrid(:,:)
     real, allocatable, save :: lapl(:,:)
     real, allocatable, save :: currGrid(:,:)
  end type grid

end module DataStruct
