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
    input [31:0] dataIn,
    input [2:0] index,
    input [3:0] nibble,
    output [31:0] dataOut
    );

    assign dataOut = 
        index == 3'b000 ? { dataIn[31:04], nibble               } : 
        index == 3'b001 ? { dataIn[31:08], nibble, dataIn[03:00]} : 
        index == 3'b010 ? { dataIn[31:12], nibble, dataIn[07:00]} : 
        index == 3'b011 ? { dataIn[31:16], nibble, dataIn[11:00]} : 
        index == 3'b100 ? { dataIn[31:20], nibble, dataIn[15:00]} : 
        index == 3'b101 ? { dataIn[31:24], nibble, dataIn[19:00]} : 
        index == 3'b110 ? { dataIn[31:28], nibble, dataIn[23:00]} : 
        index == 3'b111 ? {                nibble, dataIn[27:00]} : 
        32'bZ;
        
endmodule
