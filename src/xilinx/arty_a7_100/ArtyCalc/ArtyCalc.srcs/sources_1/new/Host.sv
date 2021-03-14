`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 02/21/2021 07:08:48 AM
// Design Name: Simple Arty Calculator - Top
// Module Name: Host
// Project Name: Simple Arty Calculator
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: This is a very simple calculator build using Digilent Arty A7-100. 
// The intention is to create a simple 2 register, 32bit, 4 function calculator
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Host(    
    input  CLK100MHZ,  // Clock signal
    input  [3:0] sw,   // Register + Byte[2:0] Selector
    output [3:0] led,  // Current byte value
    output [3:0] ledB, // Selected hexadecimalvalue byte value
    output [3:0] ledG, // Selected operator {Addition, Subtraction, Multiplication, Division}
    output [3:0] ledR, // Register + Byte[2:0] Selected
    input  [3:0] btn,  // Operator selector {Addition, Subtraction, Multiplication, Division}
    inout  [7:0] jd,    // PModKypd (hexadecimal keypad)
    
    output [7:0] jb, //VGA Red/Blue
    output [7:0] jc //VGA Green/Sync
);
//JD + PModKypd) Hexadecimal Input
//LD3B:LD0B) Selected hexadecimalvalue byte value

    wire [3:0] mapped;
    int StatusRegister;
    
    KeypadBuffered pmodKeypad(
        .SystemClock(CLK100MHZ),
        .KeypadPmodPort(jd),
        .StatusRegister(StatusRegister),
        .CurrentKeypadValue(mapped)
    );  
    
    assign ledB = 
        sw == 4'b1000 ? StatusRegister[03:00] :
        sw == 4'b1001 ? StatusRegister[07:04] :
        sw == 4'b1010 ? StatusRegister[11:08] :
        sw == 4'b1011 ? StatusRegister[15:12] :
        
        sw == 4'b1100 ? StatusRegister[19:16] :
        sw == 4'b1101 ? StatusRegister[23:20] :
        sw == 4'b1110 ? StatusRegister[27:24] :
        sw == 4'b1111 ? StatusRegister[31:28] :
        
        {$size(ledB){1'b0}};    
   
    assign led = mapped;    
    
//SW3) Register selector (A = 0, B = 1)
//LD3R) Register selected
//SW2:SW0) Register byte selector
//LD2R:LDR0) Register  byte selected

//LD7:LD4) Current byte value

//BTN3) Addition              A <= A + B
//BTN2) Subtraction           A <= A - B
//BTN1) Multiplication        A <= A * B
//BTN0) Division              A <= A / B
//LD3G:LD0G) Selected operator {Addition, Subtraction, Multiplication, Division}

endmodule