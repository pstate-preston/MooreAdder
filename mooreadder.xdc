//clock
set_property PACKAGE_PIN W19 [get_ports clock]
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clock_IBUF]
	
//resetn
set_property PACKAGE_PIN R2 [get_ports resetn]
	set_property IOSTANDARD LVCMOS33 [get_ports resetn]
	
//enable
set_property PACKAGE_PIN T1 [get_ports E]					
	set_property IOSTANDARD LVCMOS33 [get_ports E]
	
//input A switches (change package pins)
set_property PACKAGE_PIN W13 [get_ports A[3]]					
	set_property IOSTANDARD LVCMOS33 [get_ports A[3]]
set_property PACKAGE_PIN W14 [get_ports A[2]]					
	set_property IOSTANDARD LVCMOS33 [get_ports A[2]]
set_property PACKAGE_PIN V15 [get_ports A[1]]					
	set_property IOSTANDARD LVCMOS33 [get_ports A[1]]
set_property PACKAGE_PIN W15 [get_ports A[0]]					
	set_property IOSTANDARD LVCMOS33 [get_ports A[0]]

//input B switches(change package pins)
set_property PACKAGE_PIN W17 [get_ports B[3]]					
	set_property IOSTANDARD LVCMOS33 [get_ports B[3]]
set_property PACKAGE_PIN W16 [get_ports B[2]]					
	set_property IOSTANDARD LVCMOS33 [get_ports B[2]]
set_property PACKAGE_PIN V16 [get_ports B[1]]					
	set_property IOSTANDARD LVCMOS33 [get_ports B[1]]
set_property PACKAGE_PIN V17 [get_ports B[0]]					
	set_property IOSTANDARD LVCMOS33 [get_ports B[0]]

//output LEDs (change package pins)
set_property PACKAGE_PIN V19 [get_ports sum[3]]					
	set_property IOSTANDARD LVCMOS33 [get_ports sum[3]]
set_property PACKAGE_PIN U19 [get_ports sum[2]]					
	set_property IOSTANDARD LVCMOS33 [get_ports sum[2]]
set_property PACKAGE_PIN E19 [get_ports sum[1]]					
	set_property IOSTANDARD LVCMOS33 [get_ports sum[1]]
set_property PACKAGE_PIN U16 [get_ports sum[0]]					
	set_property IOSTANDARD LVCMOS33 [get_ports sum[0]]