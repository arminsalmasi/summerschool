program exDy
      implicit none
      
      integer :: m , n , j, i, alloc_error
      real, allocatable :: A(:,:)
      

      m = 0
      n = 0 
      write(*,*) "enter 1st dimension"
      read(*,*) m
      write(*,*) "enter 2nd dimension"
      read(*,*) n
      
      allocate(A(m,n), stat=alloc_error)
      if (alloc_error /= 0) call abort()


      do j = 1,n 
         A(:,j) = 65.0
      end do 
      A(1,1)=20.0; A(1,m)=70.0; A(n,1)=85.0; A(m,n)=5.0
     
      do j = 1,n
      	 write(*,'(*(F10.1))') A(:,j)
      end do
end program exDy
