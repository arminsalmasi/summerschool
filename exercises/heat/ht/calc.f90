module calc
    
    use datastruc
    
    contains
    
      function doInitGrid(nx,ny,bottomBC,topBC,rightBC,leftBC,midVal)
        integer :: nx , ny
        real :: doInitGrid(nx,ny)
        real :: bottomBC,topBC,rightBC,leftBC,midVal
        
         doInitGrid(:,:)  = midVal ! middle
         doInitGrid(:,1)  = topBC ! top
         doInitGrid(:,ny) = bottomBC ! bottom
         doInitGrid(1,:)  = leftBC ! left
         doInitGrid(nx,:) = rightBC  ! right
 
      endfunction doInitGrid

      function doCalcLapl(currvec, dx,dy)
        real :: currvec(:,:)
        integer :: i,j
        real :: Lapl( size(currvec,1)-2, size(currvec,2)-2 )
        real :: doCalcLapl( size(currvec,1)-2, size(currvec,2)-2 )
        
        
        write(*,*) size(Lapl,1)
        write(*,*) size(Lapl,2)
        
        do i = 2, size(currvec,1)-1
            do j = 2, size(currvec,2)-1
            Lapl(i,j) = ( (currvec(i-1,j) - 2 * currvec(i,j) + currvec(i+1,j) ) / (dx*dx) ) &
                + ( (currvec(i,j-1) - 2 * currvec(i,j) + currvec(i,j+1) )/ (dy*dy) )
            end do
        end do    
         
        doCalcLapl = lapl
        
        
      endfunction doCalcLapl


end module calc
