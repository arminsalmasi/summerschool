module getInput

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

  end function getInput
end module getgInput  
