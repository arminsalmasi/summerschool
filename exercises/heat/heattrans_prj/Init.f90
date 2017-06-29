!
! To change this license header, choose License Headers in Project Properties.
! To change this template file, choose Tools | Templates
! and open the template in the editor.
!
module Init
      !  use dataStruc

 contains   
     function doInitGrid(xnum,ynum,deltax,deltay,BCbot,BCtop,BCright,BCleft,ValsMid)

        implicit none
        integer :: xNum, yNum
        real :: deltaX,deltaY, bcBot,bcTop,bcRight,bcLeft,valsMid
        gr%prevGrid(xNum,yNum) :: doInitGrid
        
        
        !allocate grid(xNum,yNum)
        allocate doInitGrid.prevGrid(xNum,yNum) 
        doInitGrid(:,:)  = valsMid ! middle
        doInitGrid(:,1)  = BCtop ! top
        doInitGrid(:,ny) = BCbot ! bottom
        doInitGrid(1,:)  = BCleft ! left
        doInitGrid(nx,:) = BCright  ! right
    
    endfunction doInitGrid    
endmodule init
