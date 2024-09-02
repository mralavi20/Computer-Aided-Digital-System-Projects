	alias clc ".main clear"
	
	clc
	exec vlib work
	vmap work work
	
	set TB					"TopLevelTB"
	set hdl_path			"../src/hdl"
	set inc_path			"../src/inc"
	
	set run_time			"1000 us"
#	set run_time			"-all"

#============================ Add verilog files  ===============================
# Pleas add other module here	
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/activation.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Adder.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/And.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/And4.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/C1.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/C2.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/controler.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/datapath.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/dflipflop.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/doneChecker.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/encoder.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/fullAdder5.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/fullAdder10.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/fullAdder11.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/fullAdder12.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Multiplier.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/mux1bit2to1.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/mux1bit4to1.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/mux5bit2to1.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/mux5bit4to1.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Nand.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Not.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Not5.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/not10.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Or.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Or4.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Or5.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/PU.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Register1bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/register1biten.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/register5bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/register5biten.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/register10bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/register12bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/S1.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/S2.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/TopLevel.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Xor.v
		
	vlog 	+acc -incr -source  +incdir+$inc_path +define+SIM 	./tb/$TB.v
	onerror {break}

#================================ simulation ====================================

	vsim	-voptargs=+acc -debugDB $TB


#======================= adding signals to wave window ==========================


	add wave -hex -group 	 	{TB}				sim:/$TB/*
	add wave -hex -group 	 	{top}				sim:/$TB/uut/*	
	add wave -hex -group -r		{all}				sim:/$TB/*

#=========================== Configure wave signals =============================
	
	configure wave -signalnamewidth 2
    

#====================================== run =====================================

	run $run_time 
	