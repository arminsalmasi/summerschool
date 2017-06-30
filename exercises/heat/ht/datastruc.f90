module datastruc
    
    public
    
    type gr
        real, allocatable :: prevGrid(:,:)
        real, allocatable :: lapl(:,:)
        real, allocatable :: currGrid(:,:)
    endtype gr
  
    type(gr) :: grid
contains    
    
endmodule datastruc