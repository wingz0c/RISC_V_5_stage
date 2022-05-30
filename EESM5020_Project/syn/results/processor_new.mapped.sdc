###################################################################

# Created by write_sdc on Mon May 30 17:00:19 2022

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_load -pin_load 1 [get_ports {aluout[7]}]
set_load -pin_load 1 [get_ports {aluout[6]}]
set_load -pin_load 1 [get_ports {aluout[5]}]
set_load -pin_load 1 [get_ports {aluout[4]}]
set_load -pin_load 1 [get_ports {aluout[3]}]
set_load -pin_load 1 [get_ports {aluout[2]}]
set_load -pin_load 1 [get_ports {aluout[1]}]
set_load -pin_load 1 [get_ports {aluout[0]}]
create_clock [get_ports clk]  -period 5  -waveform {0 2.5}
group_path -name FEEDTHROUGH  -from [get_ports reset]  -to [list [get_ports {aluout[7]}] [get_ports {aluout[6]}] [get_ports {aluout[5]}] [get_ports {aluout[4]}] [get_ports {aluout[3]}] [get_ports {aluout[2]}] [get_ports {aluout[1]}] [get_ports {aluout[0]}]]
group_path -name REGIN  -from [get_ports reset]
group_path -name REGOUT  -to [list [get_ports {aluout[7]}] [get_ports {aluout[6]}] [get_ports {aluout[5]}] [get_ports {aluout[4]}] [get_ports {aluout[3]}] [get_ports {aluout[2]}] [get_ports {aluout[1]}] [get_ports {aluout[0]}]]
set_input_delay -clock clk  1  [get_ports reset]
set_output_delay -clock clk  1  [get_ports {aluout[7]}]
set_output_delay -clock clk  1  [get_ports {aluout[6]}]
set_output_delay -clock clk  1  [get_ports {aluout[5]}]
set_output_delay -clock clk  1  [get_ports {aluout[4]}]
set_output_delay -clock clk  1  [get_ports {aluout[3]}]
set_output_delay -clock clk  1  [get_ports {aluout[2]}]
set_output_delay -clock clk  1  [get_ports {aluout[1]}]
set_output_delay -clock clk  1  [get_ports {aluout[0]}]
set_input_transition -max 0.1  [get_ports reset]
set_input_transition -min 0.1  [get_ports reset]
