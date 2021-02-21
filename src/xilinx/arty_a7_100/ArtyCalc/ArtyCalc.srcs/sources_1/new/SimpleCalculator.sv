`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 02/21/2021 07:08:48 AM
// Design Name: Simple Arty Calculator
// Module Name: SimpleCalculator
// Project Name: Simple Arty Calculator
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: This is a very simple calculator build using Digilent Arty A7-100. 
// The intention is to create a simple 2 register, 32bit, 4 function calculator
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module SimpleCalculator(
    input clock,
    input [3:0] operation, // {Addition, Subtraction, Multiplication, Division}
    input [31:0] inputA,
    input [31:0] inputB,
    output reg [31:0] result
    );
    
    always @ (posedge clock) begin
        case (operation)
            4'b1000: result <= inputA + inputB;
            4'b0100: result <= inputA - inputB;
            4'b0010: result <= inputA * inputB;
            4'b0001: result <= inputA / inputB;
        endcase
    end
    
endmodule
