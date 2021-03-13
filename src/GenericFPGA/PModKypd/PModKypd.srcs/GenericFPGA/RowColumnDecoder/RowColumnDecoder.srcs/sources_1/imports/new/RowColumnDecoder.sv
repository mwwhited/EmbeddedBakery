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
    parameter RowWidth = 4
)
(
    input ScanClock,
    
    output reg [(ColumnHeight - 1):0] ColumnPins,
    input [(RowWidth - 1):0] RowPins,
    
    output reg [ValueWidth:0] Value,
    output reg ChangedValue
);  
    parameter ValueWidth = $clog2(ColumnHeight * RowWidth)-1;
    parameter CounterWidth = $clog2(ColumnHeight);
    
    reg [CounterWidth-1:0] counter;  
    
    initial begin
        ColumnPins <= {ColumnHeight{1'b0}};
        counter <= {CounterWidth{1'b0}};
        Value <= {ValueWidth{1'bZ}};
    end

    // Set Column on Read            
    always @(posedge ScanClock) begin 
        $display("=== posedge ScanClock ===");          
        ColumnPins <= ~(1<<counter);
        counter <= counter + 1;
    end   
        
    // Read Row Pins
    always @(negedge ScanClock) begin
        ChangedValue <= 1'b0;
        $display("=== negedge ScanClock ===");
        $display(">Row,Col: %b, %b \t ~Row,~Col: %b, %b", RowPins, ColumnPins, ~RowPins, ~ColumnPins);
        if (~ColumnPins && ~RowPins) begin    
            $display("** CHECK **");    
            for(int c = 0; c < ColumnHeight; c++) begin //TODO: may want to change to dynamic length if possible as this is limited to 32bx32b
                for(int r = 0; r < RowWidth; r++) begin
                    $display("}R,C: %b, %b (%b, %b)", r, c, RowPins[r], ColumnPins[c]);
                    if (~(ColumnPins[c]) & ~(RowPins[r])) begin
                        int tValue = (c * RowWidth) + r;
                    
                        if (Value != tValue) begin
                            ChangedValue <= 1'b1;
                        end
                        
                        Value <= tValue;                      
                        
                        $display("<Value: %b (%h, %h)", Value,r,c);
                    end
                end 
            end
        end
    end 
 
endmodule