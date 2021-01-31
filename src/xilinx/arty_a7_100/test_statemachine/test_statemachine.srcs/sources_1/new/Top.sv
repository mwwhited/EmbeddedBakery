`timescale 1ns / 1ps
module Top(
    input [3:0]sw
    ,input [3:0]btn
    ,output [3:0]led
    ,output led0_r
    ); 
    
    parameter carryIn = 'b0;
    RippleAdder4 FA0(sw[3:0], btn[3:0], carryIn, led[3:0], led0_r);
    
endmodule
