module Input

use heattrans_datastruc
  
  contains
    function getInput(nx,ny,dx,dy,bottomBC,tophBC,rightBC,leftBC,midVal)

      implicit none

 
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
end module getgInput  
