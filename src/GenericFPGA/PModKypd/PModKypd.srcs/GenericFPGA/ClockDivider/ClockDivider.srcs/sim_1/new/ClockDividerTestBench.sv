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
    
    initial begin
    
        for(int c = 0; c < 64 ; c++) begin
            #1 clock <= ~clock; 
        end 
    
        $finish;
    end
            
    //always #1  clock = ~clock; 
    
endmodule
