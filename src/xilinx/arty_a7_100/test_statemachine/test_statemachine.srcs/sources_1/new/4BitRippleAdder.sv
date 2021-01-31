`timescale 1ns / 1ps
module RippleAdder4(
    input [3:0]A,
    input [3:0]B,
    input CarryIn,
    output [3:0]Sum,
    output CarryOut
    );
    wire Carry[2:0];
    
    FullAdder FA0(A[0], B[0], CarryIn, Sum[0], Carry[0]);
    FullAdder FA1(A[1], B[1], Carry[0], Sum[1], Carry[1]);
    FullAdder FA2(A[2], B[2], Carry[1], Sum[2], Carry[2]);
    FullAdder FA3(A[3], B[3], Carry[2], Sum[3], CarryOut);    
endmodule
module RippleAdder8(
    input [7:0]A,
    input [7:0]B,
    input CarryIn,
    output [7:0]Sum,
    output CarryOut
    );
    reg Carry;
    
    RippleAdder4 FA0(A[3:0], B[3:0], CarryIn, Sum[3:0], Carry);
    RippleAdder4 FA1(A[7:4], B[7:4], Carry, Sum[7:4], CarryOut); 
endmodule

module RippleAdder16(
    input [15:0]A,
    input [15:0]B,
    input CarryIn,
    output [15:0]Sum,
    output CarryOut
    );
    reg Carry;
    
    RippleAdder8 FA0(A[7:0], B[7:0], CarryIn, Sum[7:0], Carry);
    RippleAdder8 FA1(A[15:8], B[15:8], Carry, Sum[15:8], CarryOut); 
endmodule
