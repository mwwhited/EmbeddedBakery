`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/04/2021 10:25:24 PM
// Design Name: 
// Module Name: PModKypd
// Project Name: 
// Target Devices: Digilent Arty A7 100t
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

module PModKypd(
    input  SystemClock,     // Clock signal
    output [3:0] ColumnPins,
    input [3:0] RowPins,
    output reg [3:0] Value
    );
    
    wire scanClock;
    ClockDivider_0 clockDivider(
        .SystemClock(SystemClock),
        .DividedClock(scanClock)
    ); 
    
    wire [3:0] decoded;
    RowColumnDecoder_0 pmodKeypad(
        .ScanClock(scanClock),
        .RowPins(RowPins),
        .ColumnPins(ColumnPins),
        .Value(decoded)
    );  
    KeypadNibbleMap keypadMapper(
        .Source(decoded),
        .Mapped(Value)
    );
    
endmodule
