## Clock signal - Sets the on-board clock
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
##Switch
set_property PACKAGE_PIN V17 [get_ports {sw}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {sw}]
	
# LEDs
set_property PACKAGE_PIN U16 [get_ports {led}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led}]
 