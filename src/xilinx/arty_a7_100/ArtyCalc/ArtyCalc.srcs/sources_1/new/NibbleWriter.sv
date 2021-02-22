`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 02/22/2021 06:07:44 AM
// Design Name: Nibble Writer
// Module Name: NibbleWriter
// Project Name: Simple Arty Calculator
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: Replace 4 bits out of 32 bits by 3 bit selector
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module NibbleWriter(
    input clock,
    inout reg [31:0] data,
    input [2:0] index,
    input [3:0] nibble
    );
    
    always @(posedge clock) begin        
        case(index)
            3'b000 : data[03:00] <= nibble;
            3'b001 : data[07:04] <= nibble;
            3'b010 : data[11:08] <= nibble;
            3'b011 : data[15:12] <= nibble;
            3'b100 : data[19:16] <= nibble;
            3'b101 : data[23:20] <= nibble;
            3'b110 : data[27:24] <= nibble;
            3'b111 : data[31:28] <= nibble;
        endcase
    end         
        
endmodule
