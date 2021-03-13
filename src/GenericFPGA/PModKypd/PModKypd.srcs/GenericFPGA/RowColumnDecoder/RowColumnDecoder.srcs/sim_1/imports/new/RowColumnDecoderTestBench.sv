`timescale 1ns / 1ps

module RowColumnDecoderTestBench;
    reg clock = 0;    
    reg [3:0] row = 4'b1111;   
    
    wire [3:0] column;
    wire [3:0] result;  
    wire changedValue;  
        
    RowColumnDecoder underTest(
        .ScanClock(clock),
        .RowPins(row),
        .ColumnPins(column),
        .Value(result),
        .ChangedValue(changedValue)    
    );
    
    always #1 clock = ~clock;
    
    int count = 0;
    int dividedCount=0;
    
    always @(posedge clock) begin
        row <= 4'b1111;
        count <= count + 1;
        dividedCount <= count / 4;
        
        if (dividedCount[3:0] == ~column) begin
            row <= column;
        end    
    end
       
endmodule
