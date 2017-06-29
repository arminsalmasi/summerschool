!
! To change this license header, choose License Headers in Project Properties.
! To change this template file, choose Tools | Templates
! and open the template in the editor.
!
module Input

!use dataStruc
  
  contains
    logical function getInput(xnum,ynum,deltax,deltay,BCbot,BCtop,BCright,BCleft,ValsMid)
      
    integer :: xNum, yNum
    real :: deltaX,deltaY, bcBot,bcTop,bcRight,bcLeft,valsMid
      

    write(*,*) "enter nx"
      read(*,*) xNum

      write(*,*) "enter ny"
      read(*,*) yNum

      write(*,*) "enter dx"
      read(*,*) deltaX

      write(*,*) "enter dy" 
      read(*,*) deltaY

      write(*,*) "enter BC for bottom boundary"
      read(*,*) bcBot

      write(*,*) "enter BC for top boundary"
      read(*,*) bcTop

      write(*,*) "enter BC for left boundary"
      read(*,*) bcLeft

      write(*,*) "enter BC for right boundary"
      read(*,*) bcRight

      write(*,*) "enter midpoint values"
      read(*,*) valsMid
      

    end function getInput
end module Input  

