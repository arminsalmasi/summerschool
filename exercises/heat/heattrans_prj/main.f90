!
! To change this license header, choose License Headers in Project Properties.
! To change this template file, choose Tools | Templates
! and open the template in the editor.
!
program heatTransfer

  use dataStruc
  
  use Input
  !implicit none

  input_err= getInput(nx,ny,dx,dy,bottomBC,topBC,rightBC,leftBC,midVal)
  !prevGrid = doInitGrid(nx,ny,bottomBC,tophBC,rightBC,leftBC,midVal)
  !lapl     = doCalcLapl(prevGrid)
  !currGrid = doAppyLapl(prevGrid, Lapl)
  !out1     = doPrintOutput(prevGrid)
  !out2     = doPrintOutput(currGrid)
  
end program heatTransfer      


