program heatTransfer 
  use input
  use allocationf
  use datastruc
  use calc
  
    in_err = getInput(nx,ny,dx,dy,bottomBC,topBC,rightBC,leftBC,midVal)
    
    in_err = doAllocateGr(nx,ny)
    
    grid%prevGrid = doInitGrid(nx,ny,bottomBC,topBC,rightBC,leftBC,midVal)
    
    
    grid%lapl = doCalcLapl(grid%prevGrid, dx,dy)
    !grid%currGrid = doApplyLapl(prevGrid, Lapl)
  !out1     = doPrintOutput(prevGrid)
  !out2     = doPrintOutput(currGrid)
  
endprogram heatTransfer      



