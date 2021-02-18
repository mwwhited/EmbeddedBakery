`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineers: Michelle Yu
//				  Josh Sackos
// 
// Create Date:    16:54:39 06/11/2012 
// Design Name: 
// Module Name:    Debouncer 
// Project Name: 	 PmodENC
// Target Devices: Nexys 3 
// Tool versions: Xilinx ISE Design Suite 14.1
//
// Description: 
//	This file defines a debouncer for eliminating the logic noise presented when the shaft is rotated.
//
// Revision: 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module Debouncer(
    clk,
    Ain,
    Bin,
    Aout,
    Bout
    );
	 
	 // ===========================================================================
	 // 										Port Declarations
	 // ===========================================================================
    input clk;
    input Ain;
    input Bin;
    output Aout;
    output Bout;

	 // ===========================================================================
	 // 							  Parameters, Regsiters, and Wires
	 // ===========================================================================
	 reg Aout = 0;
	 reg Bout = 0;

	 reg [6:0] sclk = 0;
	 reg sampledA = 0;
	 reg sampledB = 0;
	 
	 // ===========================================================================
	 // 										Implementation
	 // ===========================================================================
	 always @(posedge clk) begin
			sampledA <= Ain;
			sampledB <= Bin;
			// clock is divided to 1MHz
			// samples every 1uS to check if the input is the same as the sample
			// if the signal is stable, the debouncer should output the signal
			
			if(sclk == 7'b1100100) begin
					if(sampledA == Ain) begin
							Aout <= Ain;
					end
					
					if(sampledB == Bin) begin
							Bout <= Bin;
					end
					
					sclk <= 7'b0000000;
			end
			else begin
					sclk <= sclk + 7'b0000001;
			end
	 end

endmodule
