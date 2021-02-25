`timescale 1ns / 1ps

module RowColumnDecoderTestBench;
    reg clock = 0;    
    reg [3:0] row = 4'b1111;   
    
    wire [3:0] column;
    wire [3:0] result;  
        
    RowColumnDecoder underTest(
        .ScanClock(clock),
        .RowPins(row),
        .ColumnPins(column),
        .Value(result)        
    );

    int count;   
    int rowCounter;     
        
    always #1 begin
        count++;
        if (count > 8) begin
            count = 0;
            case (row)
                4'b1111 : row <= 4'b1110;
                4'b1110 : row <= 4'b1101;
                4'b1101 : row <= 4'b1011;
                4'b1011 : row <= 4'b0111;
                default : row <= 4'b1111;
            endcase            
        end        
        clock = ~clock; 
    end 
       
endmodule
