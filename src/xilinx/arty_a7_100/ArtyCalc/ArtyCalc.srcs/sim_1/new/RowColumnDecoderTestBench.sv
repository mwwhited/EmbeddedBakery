`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2021 11:00:10 AM
// Design Name: 
// Module Name: RowColumnDecoderTestBench
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

module RowColumnDecoderTestBench;
    reg clock = 0;    
    reg [3:0] row = 4'b0111;    
    
    wire [3:0] column;
    wire [3:0] result;  
        
    RowColumnDecoder underTest(
        .clock(clock),
        .row(row),
        .column(column),
        .result(result)        
    );
        
    always #1 clock = ~clock; 
    
    /*    
    initial
    begin  
        repeat(100000000)
        begin
            #1 clock = !clock;
        end
    end 
    */
    
endmodule
