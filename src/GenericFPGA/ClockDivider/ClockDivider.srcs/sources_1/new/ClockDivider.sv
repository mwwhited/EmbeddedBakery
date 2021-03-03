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
    parameter DividerCount = 100000,    
    parameter CounterLength = $clog2(DividerCount) + 1
)
(
    input SystemClock,
    output reg DividedClock
);    
    reg [CounterLength-1:0] counter;
    
    initial
    begin
        counter = 0;
        DividedClock = 0;
    end    
    
    always @(posedge SystemClock)
    begin
        counter <= counter + 1;
        
        if (counter >= DividerCount - 1)
        begin
            counter <= 0;
            DividedClock = ~DividedClock;
        end        
    end
    
endmodule