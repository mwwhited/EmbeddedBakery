`timescale 1ns / 1ps

module RowColumnDecoderTestBench;
    localparam ColumnHeight = 4;
    localparam RowWidth = 4;
    localparam ValueWidth = $clog2(ColumnHeight * RowWidth);
    localparam CounterWidth = $clog2(ColumnHeight);
    
    reg ScanClock = 0;    
    reg [3:0] RowPins = {RowWidth{1'bZ}};   
    
    wire [(ColumnHeight - 1):0] ColumnPins;
    wire [(ValueWidth - 1):0] Value;  
    wire ChangedValue;
    wire DetectedValue;
    wire ReleasedKey; 
    wire PressedKey;  
                
    RowColumnDecoder #(
        .ColumnHeight(ColumnHeight),
        .RowWidth(RowWidth)
    ) underTest(
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
    
    int _pushCount=0;    
    int _rowPins = 4'b1110; 
    int _colPins = 4'b1110;
    
    always @(posedge ScanClock) begin
        RowPins <= {RowWidth{1'b1}};
        count <= count + 1;
        
        if (ColumnPins == _colPins) begin
            _pushCount++;
            RowPins <= _rowPins;            
        end
        
        if (_pushCount == 2) begin
            _pushCount <= 0;
            case (_rowPins)
                4'b1110 : _rowPins <= 4'b1101;
                4'b1101 : _rowPins <= 4'b1011;
                4'b1011 : _rowPins <= 4'b0111;
                4'b0111 : _rowPins <= 4'b1111;
                4'b1111 : _rowPins <= 4'b1110;
            endcase
        end
                
        /*
        if (_rowPins > 4) begin
            case (_colPins)
                4'b1110 : _colPins <= 4'b1101;
                4'b1101 : _colPins <= 4'b1011;
                4'b1011 : _colPins <= 4'b0111;
                4'b0111 : _colPins <= 4'b1110;
            endcase
        end
        */   
    end
       
endmodule
