`timescale 1ns / 1ps

module ClockDividerTestBench;
    reg clock = 0;    
    wire sequenceClock;  
    
    ClockDivider #(
        .counterLength(5),
        .counterTarget(8)
    ) clockDivider(
        .clockIn(clock),
        .clockOut(sequenceClock)
    );
        
    always #1  clock = ~clock; 
    
endmodule
