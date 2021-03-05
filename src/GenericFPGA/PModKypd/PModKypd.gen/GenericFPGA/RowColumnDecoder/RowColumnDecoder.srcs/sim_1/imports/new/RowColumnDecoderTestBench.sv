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

    initial begin
    
        row <= 4'b1111;
        for(int c =0; c < 10; c++) begin
             #1 clock = ~clock;
        end 
        
        row <= 4'b1110;
        for(int c =0; c < 10; c++) begin
             #1 clock = ~clock;
        end 
        
        row <= 4'b1101;
        for(int c =0; c < 10; c++) begin
             #1 clock = ~clock;
        end 
        
        row <= 4'b1011;
        for(int c =0; c < 10; c++) begin
             #1 clock = ~clock;
        end 
    
        row <= 4'b0111;
        for(int c =0; c < 16; c++) begin
             #1 clock = ~clock;
        end 
        
        $finish;
    end 
       
endmodule
