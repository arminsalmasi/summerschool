module allocationf

    use datastruc  

    contains
    
    logical function doAllocateGr(nx, ny) 
        
        allocate(grid%prevGrid(nx, ny)) 
        allocate(grid%currGrid(nx, ny)) 
        allocate(grid%lapl(nx-1, ny-1))    
    
    end function doAllocateGr    

end module allocationf