`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc 2011
// Engineer: Michelle Yu  
//				 Josh Sackos
// Create Date:    17:05:39 08/23/2011 
//
// Module Name:    PmodKYPD
// Project Name:   PmodKYPD_Demo
// Target Devices: Nexys3
// Tool versions:  Xilinx ISE 14.1 
// Description: This file defines a project that outputs the key pressed on the PmodKYPD to the 
//					 seven segment display.
//
// Revision History: 
// 						Revision 0.01 - File Created (Michelle Yu)
//							Revision 0.01 - Converted from VHDL to Verilog (Josh Sackos)
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================================
// 												Define Module
// ==============================================================================================
module PmodKYPD(
    input CLK100MHZ,// 100Mhz onboard clock
    inout [7:0] jd,// Port JD on arty, JD[3:0] is Columns, JD[10:7] is rows
    output [3:0] led
    );

// ==============================================================================================
// 												Implementation
// ==============================================================================================

	//-----------------------------------------------
	//  						Decoder
	//-----------------------------------------------
	Decoder C0(
			.clk(CLK100MHZ),
			.Row(jd[7:4]),
			.Col(jd[3:0]),
			.DecodeOut(led)
	);

endmodule
