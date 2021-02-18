`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineers: Michelle Yu
//		      Josh Sackos
//
// Company: Out of Band Development 
// Engineers: Matthew WHited
// 
// Module Name:   PmodENC 
// Project Name:  PmodENC
// Target Devices: Arty1
//
// Description: 
//	This project changes the seven segment display when the position of rotary shaft
// is changed. The number on the seven segment display is relative to the start position.
// When the rotary button is pressed, the program resets. The switch controls whether 
// the seven segment display turns on or off. LED 0 and 1 indicated the direction the 
// rotary shaft is turned. LED 0 is on when the shaft is turned right, LED 1 is on when
// the shaft is turned left.
//
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module PmodENC(
    input CLK100MHZ,
    input [3:0] ja,
    output [3:0] led,
    output led0_r,
    output led1_r,
    output led3_g,
    output led2_b
    );

	 // ===========================================================================
	 // 							  Parameters, Regsiters, and Wires
	 // ===========================================================================
	 wire [3:0] an;
	 wire [6:0] seg;
	 wire [1:0] encoder;
	 
	 wire [4:0] ledset = {led3_g, led};
	 
	 /*
	 wire [3:0] led_r = {led3_r,led2_r,led1_r,led0_r};
	 wire [3:0] led_g = {led3_g,led2_g,led1_g,led0_g};
	 wire [3:0] led_b = {led3_b,led2_b,led1_b,led0_b};
	 */
	 
	 assign led0_r = encoder[0];
	 assign led1_r = encoder[1];
	 assign led2_b = ja[3];
	 
	 // ===========================================================================
	 // 										Implementation
	 // ===========================================================================
 	 Debouncer C0_Debouncer (
				  .clk(CLK100MHZ),
				  .Ain(ja[0]),
				  .Bin(ja[1]),
				  .Aout(AO),
				  .Bout(BO)
	 );
	 
 	 Encoder C1_Encoder (
				  .clk(CLK100MHZ),
				  .A(AO),
				  .B(BO),
				  .BTN(ja[2]),
				  .EncOut(ledset),
				  .LED(encoder)
	 );

/*
 	 DisplayController C2_DisplayController (
				  .clk(clk),
				  .SWT(JA[7]),
				  .DispVal(EncO),
				  .anode(an),
				  .segOut(seg)
	 );
	 */
endmodule
