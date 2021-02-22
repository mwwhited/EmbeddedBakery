`timescale 1ns / 1ps

module NibbleReaderTestBench;
    
    reg [31:0] data = 32'b1000_0111_0110_0101_0100_0011_0010_0001;
    reg [2:0] index;
    wire [3:0] nibble;
    
    NibbleReader nibbleReader(
        .data(data),
        .index(index),
        .nibble(nibble)
    );
    
    
    byte testData;    
    initial begin
        for(testData = 0; testData < 16; testData = testData + 1) begin
            index <= testData;
            #2;
        end        
    end
    
endmodule
