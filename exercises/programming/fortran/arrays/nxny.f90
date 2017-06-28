program nybyny

      implicit none
      integer :: ny, nx
      real :: nynxArray(nx+1, ny+1)

      nx=10;
      ny=10;

      do i = 1 , nx+1
         do j = 1 , ny+1
            if (i==1 .and. j==1)
               n(i,j)=20.0;
            else if (i ==1 .and. j == ny+1 )
               n(i,j) = 70.0
            else if (i==nx+1 .and. j ==1 ) 
               n(i,j) = 85.0
            else if (i == nx+1 .and. j == ny+1 )
               n(i,j) = 5.0
            end if
            n(i,j) = 65.0;
         end do
      end do

      
      
