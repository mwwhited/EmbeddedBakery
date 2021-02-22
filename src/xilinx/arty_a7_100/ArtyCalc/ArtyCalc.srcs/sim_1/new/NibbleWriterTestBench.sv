`timescale 1ns / 1ps

module NibbleWriterTestBench;

    reg clock = 0;
    reg [31:0] data = 32'b0;
    reg [2:0] index;
    reg [3:0] nibble;
    wire [31:0] result;
    
    NibbleWriter nibbleWriter(
        .dataIn(data),
        .index(index),
        .nibble(nibble),
        .dataOut(result)
    );
        
    byte testData;    
    initial begin
        for(testData = 0; testData < 32; testData = testData + 1) begin
            $monitor("testData=%d\n",testData);
            index <= testData[2:0];
            nibble <= testData;
           #5;
           data = result;
        end   
        $finish;     
    end
    
endmodule
