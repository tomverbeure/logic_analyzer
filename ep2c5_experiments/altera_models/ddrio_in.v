// megafunction wizard: %ALTDDIO_IN%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTDDIO_IN 

// ============================================================
// File Name: ddrio_in.v
// Megafunction Name(s):
// 			ALTDDIO_IN
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 13.0.1 Build 232 06/12/2013 SP 1 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2013 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module ddrio_in (
	datain,
	inclock,
	dataout_h,
	dataout_l);

	input	[15:0]  datain;
	input	  inclock;
	output	[15:0]  dataout_h;
	output	[15:0]  dataout_l;

	wire [15:0] sub_wire0;
	wire [15:0] sub_wire1;
	wire [15:0] dataout_h = sub_wire0[15:0];
	wire [15:0] dataout_l = sub_wire1[15:0];

	altddio_in	ALTDDIO_IN_component (
				.datain (datain),
				.inclock (inclock),
				.dataout_h (sub_wire0),
				.dataout_l (sub_wire1),
				.aclr (1'b0),
				.aset (1'b0),
				.inclocken (1'b1),
				.sclr (1'b0),
				.sset (1'b0));
	defparam
		ALTDDIO_IN_component.intended_device_family = "Cyclone II",
		ALTDDIO_IN_component.invert_input_clocks = "OFF",
		ALTDDIO_IN_component.lpm_hint = "UNUSED",
		ALTDDIO_IN_component.lpm_type = "altddio_in",
		ALTDDIO_IN_component.power_up_high = "OFF",
		ALTDDIO_IN_component.width = 16;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: INVERT_INPUT_CLOCKS STRING "OFF"
// Retrieval info: CONSTANT: LPM_HINT STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altddio_in"
// Retrieval info: CONSTANT: POWER_UP_HIGH STRING "OFF"
// Retrieval info: CONSTANT: WIDTH NUMERIC "16"
// Retrieval info: USED_PORT: datain 0 0 16 0 INPUT NODEFVAL "datain[15..0]"
// Retrieval info: CONNECT: @datain 0 0 16 0 datain 0 0 16 0
// Retrieval info: USED_PORT: dataout_h 0 0 16 0 OUTPUT NODEFVAL "dataout_h[15..0]"
// Retrieval info: CONNECT: dataout_h 0 0 16 0 @dataout_h 0 0 16 0
// Retrieval info: USED_PORT: dataout_l 0 0 16 0 OUTPUT NODEFVAL "dataout_l[15..0]"
// Retrieval info: CONNECT: dataout_l 0 0 16 0 @dataout_l 0 0 16 0
// Retrieval info: USED_PORT: inclock 0 0 0 0 INPUT_CLK_EXT NODEFVAL "inclock"
// Retrieval info: CONNECT: @inclock 0 0 0 0 inclock 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL ddrio_in.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddrio_in.qip TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddrio_in.bsf TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddrio_in_inst.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddrio_in_bb.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddrio_in.inc TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddrio_in.cmp TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddrio_in.ppf TRUE FALSE
// Retrieval info: LIB_FILE: altera_mf
