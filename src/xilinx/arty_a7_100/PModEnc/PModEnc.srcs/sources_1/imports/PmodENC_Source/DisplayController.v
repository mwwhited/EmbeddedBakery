`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineers: Michelle Yu
//				  Josh Sackos
// 
// Create Date:    14:35:33 06/11/2012 
// Module Name:    DisplayController 
// Project Name: 	 PmodENC
// Target Devices: Nexys 3 
// Tool versions: Xilinx ISE Design Suite 14.1
//
// Description: 
// This module defines a DisplayController that controls the seven segment display to work with 
// the output of the Encoder
//
// Revision: 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module DisplayController(
    clk,
    SWT,
    DispVal,
    anode,
    segOut
    );

	 // ===========================================================================
	 // 										Port Declarations
	 // ===========================================================================
    input clk;
    input SWT;
    input [4:0] DispVal;
    output [3:0] anode;
    output [6:0] segOut;

	 // ===========================================================================
	 // 							  Parameters, Regsiters, and Wires
	 // ===========================================================================
	 reg [3:0] anode;
	 reg [6:0] segOut;

	 reg [17:0] sclk;
	 reg [6:0] seg;
	 
	 // ===========================================================================
	 // 										Implementation
	 // ===========================================================================
	 always @(posedge clk)
	 begin
			// turns off the seven segment display when the switch is off
			// or else turn on the seven segment display
			if(SWT == 1'b0)
				begin
						anode <= 4'b1111;
				end

			// refresh each digit
			else
				begin
						// 0 ms refersh digit 0
						if(sclk == 18'b000000000000000000)
							begin
									anode <= 4'b1110;
									segOut <= seg;
									sclk <= sclk + 1'b1;
							end

						// 1ms refresh digit 1
						else if(sclk == 18'b011000011010100000)
							begin
									// display a 1 on the tenth digit if the number is greater than 9
									if(DispVal > 5'b01001)
										begin
												segOut <= 7'b1111001;
												anode <= 4'b1101;
										end
									
									sclk <= sclk + 1'b1;									
							end

						//	2ms
						else if(sclk == 18'b110000110101000000)
							begin
									sclk <= 18'b000000000000000000;
							end

						// Increment
						else
							begin
									sclk <= sclk + 1'b1;
							end
				end
	 end
	 
	 //  Selects the value to display on the SSD
	 always @(DispVal[4] or DispVal[3] or DispVal[2] or DispVal[1] or DispVal[0])
	 case (DispVal[4:0])

			5'b00000 : seg <= 7'b1000000;		// 0
			5'b00001 : seg <= 7'b1111001;		// 1
			5'b00010 : seg <= 7'b0100100;		// 2
			5'b00011 : seg <= 7'b0110000;		// 3
			5'b00100 : seg <= 7'b0011001;		// 4
			5'b00101 : seg <= 7'b0010010;		// 5
			5'b00110 : seg <= 7'b0000010;		// 6
			5'b00111 : seg <= 7'b1111000;		// 7
			5'b01000 : seg <= 7'b0000000;		// 8
			5'b01001 : seg <= 7'b0010000;		// 9
			5'b01010 : seg <= 7'b1000000;		// 10
			5'b01011 : seg <= 7'b1111001;		// 11
			5'b01100 : seg <= 7'b0100100;		// 12
			5'b01101 : seg <= 7'b0110000;		// 13
			5'b01110 : seg <= 7'b0011001;		// 14
			5'b01111 : seg <= 7'b0010010;		// 15
			5'b10000 : seg <= 7'b0000010;		// 16
			5'b10001 : seg <= 7'b1111000;		// 17
			5'b10010 : seg <= 7'b0000000;		// 18
			5'b10011 : seg <= 7'b0010000;		// 19
			default : seg <= 7'b0111111;

	 endcase

endmodule
