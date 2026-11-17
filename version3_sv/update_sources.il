let((cv inst netName pwlStr)
  cv = dbOpenCellViewByType("mult" "TB_booth_multiplier_8x8" "schematic" "" "w")
  when(cv
    foreach(inst cv->instances
      when(inst->cellName == "vsource"
        netName = car(inst->conns)->net->name
        when(netName == "a<0>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 1.8 2e-08 1.8 4e-08 1.8 6.000000000000001e-08 0.0 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 1.8 1.6e-07 0.0 1.8000000000000002e-07 0.0 \" "))
        when(netName == "b<0>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 1.8 4e-08 0.0 6.000000000000001e-08 0.0 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 1.8 1.6e-07 1.8 1.8000000000000002e-07 0.0 \" "))
        when(netName == "a<1>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 1.8 2e-08 0.0 4e-08 0.0 6.000000000000001e-08 0.0 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 1.8 1.6e-07 0.0 1.8000000000000002e-07 0.0 \" "))
        when(netName == "b<1>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 1.8 2e-08 1.8 4e-08 1.8 6.000000000000001e-08 1.8 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 1.8 1.6e-07 1.8 1.8000000000000002e-07 0.0 \" "))
        when(netName == "a<2>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 1.8 4e-08 1.8 6.000000000000001e-08 1.8 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 1.8 1.4e-07 1.8 1.6e-07 0.0 1.8000000000000002e-07 0.0 \" "))
        when(netName == "b<2>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 0.0 6.000000000000001e-08 1.8 8e-08 1.8 1.0000000000000001e-07 1.8 1.2000000000000002e-07 0.0 1.4e-07 1.8 1.6e-07 1.8 1.8000000000000002e-07 1.8 \" "))
        when(netName == "a<3>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 1.8 6.000000000000001e-08 1.8 8e-08 0.0 1.0000000000000001e-07 0.0 1.2000000000000002e-07 1.8 1.4e-07 1.8 1.6e-07 1.8 1.8000000000000002e-07 0.0 \" "))
        when(netName == "b<3>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 0.0 6.000000000000001e-08 1.8 8e-08 1.8 1.0000000000000001e-07 1.8 1.2000000000000002e-07 0.0 1.4e-07 1.8 1.6e-07 0.0 1.8000000000000002e-07 1.8 \" "))
        when(netName == "a<4>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 1.8 6.000000000000001e-08 1.8 8e-08 0.0 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 0.0 1.6e-07 1.8 1.8000000000000002e-07 1.8 \" "))
        when(netName == "b<4>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 0.0 6.000000000000001e-08 1.8 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 0.0 1.6e-07 0.0 1.8000000000000002e-07 1.8 \" "))
        when(netName == "a<5>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 1.8 6.000000000000001e-08 1.8 8e-08 0.0 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 0.0 1.6e-07 1.8 1.8000000000000002e-07 1.8 \" "))
        when(netName == "b<5>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 0.0 6.000000000000001e-08 1.8 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 0.0 1.6e-07 0.0 1.8000000000000002e-07 1.8 \" "))
        when(netName == "a<6>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 1.8 6.000000000000001e-08 1.8 8e-08 0.0 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 0.0 1.6e-07 1.8 1.8000000000000002e-07 1.8 \" "))
        when(netName == "b<6>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 0.0 6.000000000000001e-08 1.8 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 0.0 1.6e-07 0.0 1.8000000000000002e-07 1.8 \" "))
        when(netName == "a<7>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 1.8 6.000000000000001e-08 1.8 8e-08 0.0 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 0.0 1.6e-07 1.8 1.8000000000000002e-07 1.8 \" "))
        when(netName == "b<7>"
          dbReplaceProp(inst "pwl" "string" "file NULL pwl \" 0 0 0.0 0.0 2e-08 0.0 4e-08 0.0 6.000000000000001e-08 1.8 8e-08 1.8 1.0000000000000001e-07 0.0 1.2000000000000002e-07 0.0 1.4e-07 0.0 1.6e-07 0.0 1.8000000000000002e-07 1.8 \" "))
      )
    )
    dbSave(cv)
    dbClose(cv)
    println("Successfully updated all vsource PWL waveforms in schematic!")
  )
)
