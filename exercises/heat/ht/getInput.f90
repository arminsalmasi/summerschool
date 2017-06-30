module input
    contains
    
    !gr function initialize (xNum,yNum)
    !    implicit none
    !    integer :: xNum, yNum
    !   
    !   allocate gr%prevGrid(xNum, yNum) 
    !    allocate gr%currGrid(xNum, yNum) 
    !    allocate gr%lapl(xNum-1, yNum-1)   
    
    !end function initialize  
    
    
    logical function getInput(xNum,yNum,deltaX,deltaY,BCbot,BCtop,BCright,BCleft,ValsMid)

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

end module input  
