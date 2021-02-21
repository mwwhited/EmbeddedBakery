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
    output [3:0] led,  // Register + Byte[2:0] Selected
    output [3:0] ledB, // Selected hexadecimalvalue byte value
    output [3:0] ledG, // Selected operator {Addition, Subtraction, Multiplication, Division}
    output [3:0] ledR, // Current byte value
    input  [3:0] btn,  // Operator selector {Addition, Subtraction, Multiplication, Division}
    inout  [7:0] jd    // PModKypd (hexadecimal keypad)
);

//SW3) Register selector (A = 0, B = 1)
//LD7) Register selected 

//SW2:SW0) Register byte selector
//LD6:LD4) Register  byte selcted

//BTN3) Addition              A <= A + B
//BTN2) Subtraction           A <= A - B
//BTN1) Multiplication        A <= A * B
//BTN0) Division              A <= A / B
//LD3G:LD0G) Selected operator {Addition, Subtraction, Multiplication, Division}

//JD + PModKypd) Hexadecimal Input
//LD3B:LD0B) Selected hexadecimalvalue byte value
//LD3R:LD0R) Current byte value

    assign led = sw;
    //assign ledB = // PModKypd output
    assign ledG = btn;    
   // assign ledR = //value in selected register
   
   assign ledB = jd[3:0];
     
    RowColumnDecoder pmodKeypad(
        .clock(CLK100MHZ),
        .row(jd[7:4]),
        .column(jd[3:0]),
        .result(ledB),
        
        .sequenceClock(ledR[1]),
        .columnDelay(ledR[2])
    );
      
  /*  
   reg [31:0] aRegister;
   reg [31:0] bRegister;  
   
   //TODO: debounce input for buttons
   
   SimpleCalculator simpleCalculator(
       .clock(CLK100MHZ),
       .operation(btn),
       .inputA(aRegister),
       .inputB(bRegister),
       .result(aRegister)
   );
   */ 
   
endmodule