`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 02/21/2021 07:54:28 AM
// Design Name: Row x Column Decoder
// Module Name: RowColumnDecoder
// Project Name: Simple Arty Calculator
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: Simple Row/Column matrix decoder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RowColumnDecoder #(
    parameter ColumnHeight = 4,
    parameter RowWidth = 4,
    
    parameter ValueWidth = $clog2(ColumnHeight * RowWidth)-1,
    parameter CounterWidth = $clog2(ColumnHeight)
)
(
    input ScanClock,
    
    output reg [(ColumnHeight - 1):0] ColumnPins,
    input [(RowWidth - 1):0] RowPins,
    
    output reg [ValueWidth:0] Value
);  
    reg [CounterWidth-1:0] counter;    
    
    initial
    begin
        counter <= 0;
        Value <= 'Z;         
    end

    // Set Column on Read            
    always @(posedge ScanClock) begin  
        $display(">Counter: %b", counter);
        $display(">ColumnPins: %b", ColumnPins);
         
        ColumnPins <= ~(1<<counter);
        counter <= counter + 1;
        
        $display("<Counter: %b", counter);
        $display("<ColumnPins: %b", ColumnPins);
    end   
    
    // Read Row Pins
    always @(negedge ScanClock) begin
        $display(">RowPins: %b", RowPins);
        $display(">~RowPins: %b", ~RowPins);
        $display(">Value: %b", Value);
        if(~RowPins) begin
            Value <= ($clog2(~ColumnPins) * RowWidth) + $clog2(~RowPins);
            $display("<Value: %b", Value);
        end
    end 
 
endmodule
