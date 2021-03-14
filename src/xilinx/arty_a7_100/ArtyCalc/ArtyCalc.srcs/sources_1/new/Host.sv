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
    wire [3:0] read;
    wire [63:0] StatusRegister;
    
    KeypadBuffered pmodKeypad(
        .Reset(btn[0]),
        
        .KeypadClock(CLK100MHZ),
        .KeypadPmodPort(jd),
        .CurrentKeypadValue(mapped),
        
        .ReadClock(btn[1]),
        .ReadEnable(btn[2]),
        .ReadValue(read),
        
        .StatusRegister(StatusRegister)
    );  
    
    wire [3:0] _statusRegister [0:15];
    assign _statusRegister = {<<{StatusRegister}};
    
    assign ledB = _statusRegister[sw[3:0]];
    assign ledG = read;
    assign ledR = sw;
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