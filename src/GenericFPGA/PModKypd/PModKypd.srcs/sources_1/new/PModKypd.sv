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

module PModKypd (
    input  ScanClock,  
    output [3:0] ColumnPins,
    input [3:0] RowPins,
    output [3:0] Value,
    output ChangedValue,
    output DetectedValue,
    output ReleasedKey,
    output PressedKey
);        
    wire [3:0] decoded;
    
    RowColumnDecoder_0 pmodKeypad(
        .ScanClock(ScanClock),
        .RowPins(RowPins),
        .ColumnPins(ColumnPins),
        .Value(decoded),
        
        .ChangedValue(ChangedValue),
        .DetectedValue(DetectedValue),
        .ReleasedKey(ReleasedKey),
        .PressedKey(PressedKey)
    );  
    
    KeypadNibbleMap keypadMapper(
        .Source(decoded),
        .Mapped(Value)
    );
    
endmodule
