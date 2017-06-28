program heatTransfer

  use heattrans_datastruct

  implicit none
  logical:: input_err, out_err_1, out_err_2

  

  
  input_err=getInput(nx,ny,dx,dy,bottomBC,tophBC,rightBC,leftBC,midVal)
  prevGrid = doInitGrid(nx,ny,bottomBC,tophBC,rightBC,leftBC,midVal)
  lapl = doCalcLapl(prevGrid)
  currGrid = doAppyLapl(prevGrid, Lapl)
  out1 = doPrintOutput(prevGrid)
  out2 = doPrintOutput(currGrid)
  
end program heatTransfer      
