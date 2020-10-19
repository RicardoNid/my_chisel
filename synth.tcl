cd E:/LtrProjects/SharedProjects/my_chisel
set outputDir ./synth_output
set design FirFilter

file mkdir $outputDir

read_verilog $design.v

synth_design -top $design -part xcku040-ffva1156-2-i -rtl

start_gui
show_schematic [get_nets]
write_schematic -force -format pdf ./synth_output/$design.pdf
stop_gui