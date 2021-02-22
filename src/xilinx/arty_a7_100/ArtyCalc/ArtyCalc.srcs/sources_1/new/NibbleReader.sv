`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 02/22/2021 05:39:15 AM
// Design Name: Nibble Reader
// Module Name: NibbleReader
// Project Name: Simple Arty Calculator
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: Select 4 bits out of 32 bits by 3 bit selector
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module NibbleReader(
    input [31:0] data,
    input [2:0] index,
    output [3:0] nibble
    );
    
    assign nibble = 
        index == 3'b000 ? data[03:00] : 
        index == 3'b001 ? data[07:04] : 
        index == 3'b010 ? data[11:08] : 
        index == 3'b011 ? data[15:12] : 
        index == 3'b100 ? data[19:16] : 
        index == 3'b101 ? data[23:20] : 
        index == 3'b110 ? data[27:24] : 
        index == 3'b111 ? data[31:28] : 
        4'bZ;   
    
endmodule
