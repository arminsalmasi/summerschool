!
! To change this license header, choose License Headers in Project Properties.
! To change this template file, choose Tools | Templates
! and open the template in the editor.
!

module dataStruc

Public
  
  integer, public :: nx, ny
  real, public    :: dx, dy, bottomBC, topBC, leftBC, rightBC, midVal
  logical, public :: in_err, out_errq, out_err2
  

  type grid
     real, allocatable :: prevGrid(:,:)
     real, allocatable :: lapl(:,:)
     real, allocatable :: currGrid(:,:)
  endtype grid

endmodule dataStruc
