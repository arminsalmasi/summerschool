function doInitGrid(nx,ny, bottomBC, tophBC, rightBC, leftBC, midVal)
  implicit none

! Do
  init(:,:) = midVal    ! middle values
  init(:,1) = topBC     ! top boundry condition
  init(:,ny) = bottomBC ! bottom boundry condition
  init(1,:) = leftBC    ! left boundry condition
  init(nx,:) = rightBC  ! right boundry condition
! Report
  doInitGrid = init


  end function doInitGrid
  
