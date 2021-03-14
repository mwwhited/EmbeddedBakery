`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/13/2021 10:35:58 AM
// Design Name: 
// Module Name: PModKypdTestBench
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


module PModKypdTestBench;

    reg  ScanClock = 0;
    reg [3:0] RowPins = 0;
    
    wire [3:0] ColumnPins;
    wire [3:0] Value;
    wire ChangedValue;
    wire DetectedValue;
    wire ReleasedKey;
    wire PressedKey;

    PModKypd uut (
        .ScanClock(ScanClock),
        .RowPins(RowPins),
        
        .ColumnPins(ColumnPins),
        .Value(Value),
        
        .ChangedValue(ChangedValue),
        .DetectedValue(DetectedValue),
        .ReleasedKey(ReleasedKey),
        .PressedKey(PressedKey)
    );
    
    always #1 ScanClock = ~ScanClock;
    
    int count = 0;
    int dividedCount=0;
    
    always @(posedge ScanClock) begin
        RowPins <= 4'b1111;
        count <= count + 1;
        dividedCount <= count / 4;
        
        if (dividedCount[3:0] == ~ColumnPins) begin
            RowPins <= ColumnPins;
        end    
    end

endmodule
