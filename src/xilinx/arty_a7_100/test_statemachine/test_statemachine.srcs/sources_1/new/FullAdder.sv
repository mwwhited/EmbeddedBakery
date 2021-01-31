`timescale 1ns / 1ps
module FullAdder(
    input A,
    input B,
    input CarryIn,
    output Sum,
    output CarryOut
    );
    
    reg Sum, CarryOut;
    always@(A or B or CarryIn)
    begin
        Sum <= A ^ B ^ CarryIn;
        CarryOut <= (A & B) | (A & CarryIn) | (B & CarryIn);        
    end   
    
endmodule
