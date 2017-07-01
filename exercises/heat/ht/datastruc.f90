module datastruc
    
    public
    
    integer :: nx, ny
    real    :: dx, dy, bottomBC, topBC, leftBC, rightBC, midVal
    logical :: in_err
    
    type gr
        real, allocatable :: prevGrid(:,:)
        real, allocatable :: lapl(:,:)
        real, allocatable :: currGrid(:,:)
    endtype gr
  
    type(gr) :: grid
contains    
    
endmodule datastruc