`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 02/21/2021 07:54:28 AM
// Design Name: Clock Divider
// Module Name: ClockDivider
// Project Name: Simple Arty Calculator
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: Use counter to divide down input clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ClockDivider #(
    parameter counterLength = 17,
    parameter counterTarget = 100000
)
(
    input clockIn,
    output reg clockOut
);    
    reg [counterLength-1:0] counter;
    
    initial
    begin
        counter = 0;
        clockOut = 0;
    end    
    
    always @(posedge clockIn)
    begin
        counter <= counter + 1;
        
        if (counter >= counterTarget - 1)
        begin
            counter <= 0;
            clockOut = ~clockOut;
        end        
    end
    
endmodule