!
! To change this license header, choose License Headers in Project Properties.
! To change this template file, choose Tools | Templates
! and open the template in the editor.
!
module Input

use dataStruc
  
  contains
    logical function getInput(nx,ny,dx,dy,bottomBC,tophBC,rightBC,leftBC,midVal)
      
    integer :: nx, ny
    real :: dx,dy, bottomBC,tophBC,rightBC,leftBC,midVal
      

    write(*,*) "enter nx"
      read(*,*) nx

      write(*,*) "enter ny"
      read(*,*) ny

      write(*,*) "enter dx"
      read(*,*) dx

      write(*,*) "enter dy" 
      read(*,*) dy

      write(*,*) "enter BC for bottom boundary"
      read(*,*) lowbC

      write(*,*) "enter BC for top boundary"
      read(*,*) topBC

      write(*,*) "enter BC for left boundary"
      read(*,*) leftBC

      write(*,*) "enter BC for right boundary"
      read(*,*) rightBC

      write(*,*) "enter midpoint values"
      read(*,*) midVal
      

    end function getInput
end module Input  

