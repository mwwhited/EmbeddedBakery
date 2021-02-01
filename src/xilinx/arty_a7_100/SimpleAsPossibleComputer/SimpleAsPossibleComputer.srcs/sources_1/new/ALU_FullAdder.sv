`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 01/31/2021 12:59:25 PM
// Design Name: 
// Module Name: ALU.FullAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_FullAdder(
    input A,
    input B,
    input CarryIn,
    output Sum,
    output CarryOut
    );   
    assign {CarryOut, Sum} = A + B + CarryIn;    
endmodule
