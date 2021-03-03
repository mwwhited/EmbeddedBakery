`timescale 1ns / 1ps

module ClockDividerTestBench;
    reg clock = 0;    
    wire sequenceClock;  
    
    ClockDivider #(
        .DividerCount(8)
    ) clockDivider(
        .SystemClock(clock),
        .DividedClock(sequenceClock)
    );
            
    always #1  clock = ~clock; 
    
endmodule
