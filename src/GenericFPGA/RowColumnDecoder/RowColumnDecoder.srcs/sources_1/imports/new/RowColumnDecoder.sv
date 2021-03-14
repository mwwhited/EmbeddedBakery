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

class PriorityEncoder #(
    parameter int BitWidth
);
    localparam int EncodedBitWidth = $clog2(BitWidth);
    function [(EncodedBitWidth - 1):0] LSB(
        [(BitWidth - 1):0] value
    );
        for (int c = 0; c < BitWidth; c++) begin
            if (value[c] == 1'b1) begin
                return c;
            end  
        end
        return {EncodedBitWidth{1'bZ}};
    endfunction
    
    function [(EncodedBitWidth - 1):0] MSB(
        [(BitWidth - 1):0] value
    );
        for (int c = (BitWidth - 1); c >= 0; c--) begin
            if (value[c] == 1'b1) begin
                return c;
            end  
        end
        return {EncodedBitWidth{1'bZ}};
    endfunction
endclass

module RowColumnDecoder #(
    parameter int ColumnHeight = 4,
    parameter int RowWidth = 4
)
(
    input ScanClock,
    
    output reg [(ColumnHeight - 1):0] ColumnPins,
    input [(RowWidth - 1):0] RowPins,
    
    output reg [(($clog2(ColumnHeight) + $clog2(RowWidth)) - 1):0] Value,
    output reg ChangedValue,
    output reg DetectedValue,
    output reg ReleasedKey,
    output PressedKey
);  
    localparam ValueWidth = $clog2(ColumnHeight) + $clog2(RowWidth);
    reg [(RowWidth - 1):0] _lastScan [($clog2(ColumnHeight)-1):0]; 
    
    assign PressedKey = ChangedValue && !ReleasedKey; 
                
    initial begin
        ColumnPins <= {{(ColumnHeight - 1){1'b1}}, 1'b0};
        Value <= {ValueWidth{1'bZ}};
        
        foreach(_lastScan[c]) begin
            _lastScan[c] <= {RowWidth{1'b1}};
        end
    end
        
    // Set Column on Read            
    always @(posedge ScanClock) begin
        for(int cp = 1; cp < $size(ColumnPins); cp++) begin
             ColumnPins[cp] <= ColumnPins[cp - 1];
        end
        ColumnPins[0] <= ColumnPins[$size(ColumnPins)-1];
    end  
    
    PriorityEncoder #(ColumnHeight) _col;
    PriorityEncoder #(RowWidth) _row;   
      
    always @(negedge ScanClock) begin 
        ChangedValue <= 1'b0;
        ReleasedKey <= 1'b0;
        DetectedValue <= 1'b0;
        
        $display("=== negedge ScanClock ===");
        $display(">C,R: %b, %b", ColumnPins, RowPins);
                       
        if (~ColumnPins) begin    
        
            if (_lastScan[_col.LSB(~ColumnPins)] != RowPins) begin
                //change
                $display("--- RowPins Changed? ===");
                ChangedValue <= 1'b1;
                
                if (!(~RowPins)) begin
                    ReleasedKey <= 1'b1;
                end
                
            end
            
            _lastScan[_col.LSB(~ColumnPins)] <= RowPins;
            
            if (~RowPins) begin
                DetectedValue <= 1'b1;
            
                Value <= { 
                    _col.LSB(~ColumnPins),
                    _row.LSB(~RowPins)
                };
                $display("<Value: %b", { 
                    _col.LSB(~ColumnPins),
                    _row.LSB(~RowPins)
                });
            end            
        end
    end 
  
endmodule