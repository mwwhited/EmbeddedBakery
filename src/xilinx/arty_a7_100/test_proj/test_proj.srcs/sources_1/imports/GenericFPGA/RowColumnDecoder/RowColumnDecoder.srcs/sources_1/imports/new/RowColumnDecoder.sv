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
    
    function [(BitWidth - 1):0] RotateLeft(
        [(BitWidth - 1):0] value
    );
        return {value[(BitWidth-2):0], value[BitWidth - 1]};
    endfunction
    
    function [(BitWidth - 1):0] RotateRight(
        [(BitWidth - 1):0] value
    );
        return {value[BitWidth - 0], value[(BitWidth-1):1]};
    endfunction
endclass

module RowColumnDecoder #(
    parameter int ColumnHeight  = 4,
    parameter int RowWidth      = 4
) (
    input ScanClock,
    
    output reg [(ColumnHeight - 1):0] ColumnPins,
    input      [(RowWidth - 1):0] RowPins,
    
    output reg [(($clog2(ColumnHeight) + $clog2(RowWidth)) - 1):0] Value,
    output reg ReleasedKey,
    output reg PressedKey
);  
    localparam ValueWidth = $clog2(ColumnHeight) + $clog2(RowWidth);
    
    logic [(ValueWidth - 1):0] _lastColumn;
    logic [(ValueWidth - 1):0] _lastRow   ;
                 
    initial begin
        __Reset();
        Value <= {ValueWidth{1'bZ}};                
    end
        
    typedef enum {
        ScanColumns = 1 ,
        IdleColumns = 2 ,
        KeyPressed  = 3 ,
        KeyReleased = 4 ,
        Reset       = 5 
    } States;
    States state;
    
    PriorityEncoder #(ColumnHeight) _col;
    PriorityEncoder #(RowWidth) _row;  
            
    // Set Column on Read            
    always_ff @(posedge ScanClock) begin
        state <= CheckStateMachine(state, ColumnPins, RowPins);
    end
    
    function States CheckStateMachine(
        input States request,        
        input [(ColumnHeight-1):0] columnValue,
        input [(RowWidth - 1):0  ] rowValue
        );
        case (request) 
            ScanColumns : return __ScanColumns (request, columnValue, rowValue);
            IdleColumns : return __IdleColumns (request, columnValue, rowValue);
            KeyPressed  : return __KeyPressed  (request, columnValue, rowValue);
            KeyReleased : return __KeyReleased (request, columnValue, rowValue);
            default     : return __Reset();
        endcase
    endfunction
    
    function States __Reset();           
        ReleasedKey   <= 1'b0;  
        PressedKey    <= 1'b0;   
        
        ColumnPins <= {{(ColumnHeight - 1){1'b1}}, 1'b0};
        return state.first;
    endfunction
            
    function States __ScanColumns(
        input States request,        
        input [(ColumnHeight-1):0] columnValue,
        input [(RowWidth - 1):0  ] rowValue
    );      
        ColumnPins <= _col.RotateLeft(ColumnPins);
        return IdleColumns;
    endfunction  
           
    function States __IdleColumns(
        input States request,        
        input [(ColumnHeight-1):0] columnValue,
        input [(RowWidth - 1):0  ] rowValue
    );
        if (~columnValue && ~rowValue) begin
            _lastRow <= rowValue;
            _lastColumn <= columnValue;
    
            Value <= {
                _col.LSB(~columnValue),
                _row.LSB(~rowValue)
            };
            
            PressedKey    <= 1'b1;
            return KeyPressed;            
        end
        
        return ScanColumns;   
    endfunction   
             
    function States __KeyPressed(
        input States request,        
        input [(ColumnHeight-1):0] columnValue,
        input [(RowWidth - 1):0  ] rowValue
    );
        _lastRow <= rowValue;
        _lastColumn <= columnValue;
        
        if (_lastColumn == columnValue &&
            _lastRow == rowValue
        ) begin
            return KeyPressed;
        end     
        
        ReleasedKey   <= 1'b1;  
        return KeyReleased;
    endfunction    
         
    function States __KeyReleased(
        input States request,        
        input [(ColumnHeight-1):0] columnValue,
        input [(RowWidth - 1):0  ] rowValue
    );
        return state.last;
    endfunction 
     
endmodule