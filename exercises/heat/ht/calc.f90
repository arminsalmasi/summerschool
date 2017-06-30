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

      function doCalcLapl(currvec)
        real :: currvec(:,:)
        integer :: i,j
        
        real :: doCalcLapl(size(currvec,1)-2,size(currvec,2)-2)
        
        do i = 2, size(currvec,1)
            do j = 2, size(currvec,2)
            end do
        end do    
         
      endfunction doCalcLapl


end module calc
