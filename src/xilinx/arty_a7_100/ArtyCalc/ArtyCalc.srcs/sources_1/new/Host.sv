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
    output reg [3:0] led,  // Current byte value
    output reg [3:0] ledB, // Selected hexadecimalvalue byte value
    output reg [3:0] ledG, // Selected operator {Addition, Subtraction, Multiplication, Division}
    output reg [3:0] ledR, // Register + Byte[2:0] Selected
    input  [3:0] btn,  // Operator selector {Addition, Subtraction, Multiplication, Division}
    inout  [7:0] jd    // PModKypd (hexadecimal keypad)
);
//JD + PModKypd) Hexadecimal Input
//LD3B:LD0B) Selected hexadecimalvalue byte value
    RowColumnDecoder pmodKeypad(
        .clock(CLK100MHZ),
        .row(jd[7:4]),
        .column(jd[3:0]),
        .result(ledB)
    );
    
    
    /*
    NibbleReader(
    input [31:0] data,
    input [2:0] index,
    output [3:0] nibble
    );
    */
    
//SW3) Register selector (A = 0, B = 1)
//LD3R) Register selected
//SW2:SW0) Register byte selector
//LD2R:LDR0) Register  byte selcted
    assign ledR = sw;
    reg [31:0] registerA;
    reg [31:0] registerB;
    
    always @(negedge CLK100MHZ) begin
        case(sw)
            4'b0_000 : led = registerA[03:00];
            4'b0_001 : led = registerA[07:04];
            4'b0_010 : led = registerA[11:08];
            4'b0_011 : led = registerA[15:12];
            4'b0_100 : led = registerA[19:16];
            4'b0_101 : led = registerA[23:20];
            4'b0_110 : led = registerA[27:24];
            4'b0_111 : led = registerA[31:28];
            /*
            
            4'b0_000 : led = 4'b1111;// registerA[03:00];
            4'b0_001 : led = 4'b1110;// registerA[07:04];
            4'b0_010 : led = 4'b1101;// registerA[11:08];
            4'b0_011 : led = 4'b1011;// registerA[15:12];
            4'b0_100 : led = 4'b0111;// registerA[19:16];
            4'b0_101 : led = 4'b1010;// registerA[23:20];
            4'b0_110 : led = 4'b0101;// registerA[27:24];
            4'b0_111 : led = 4'b0110;// registerA[31:28];
            
            4'b1_000 : led = registerB[03:00];
            4'b1_001 : led = registerB[07:04];
            4'b1_010 : led = registerB[11:08];
            4'b1_011 : led = registerB[15:12];
            4'b1_100 : led = registerB[19:16];
            4'b1_101 : led = registerB[23:20];
            4'b1_110 : led = registerB[27:24];
            4'b1_111 : led = registerB[31:28];
            */
        endcase
    end
        
    always @(ledB)
    begin
        case(sw)
            4'b0_000 : registerA[03:00] = ledB;
            4'b0_001 : registerA[07:04] = ledB;
            4'b0_010 : registerA[11:08] = ledB;
            4'b0_011 : registerA[15:12] = ledB;
            4'b0_100 : registerA[19:16] = ledB;
            4'b0_101 : registerA[23:20] = ledB;
            4'b0_110 : registerA[27:24] = ledB;
            4'b0_111 : registerA[31:28] = ledB;
            /*
            4'b1_000 : registerB[03:00] = ledB;
            4'b1_001 : registerB[07:04] = ledB;
            4'b1_010 : registerB[11:08] = ledB;
            4'b1_011 : registerB[15:12] = ledB;
            4'b1_100 : registerB[19:16] = ledB;
            4'b1_101 : registerB[23:20] = ledB;
            4'b1_110 : registerB[27:24] = ledB;
            4'b1_111 : registerB[31:28] = ledB;
            */
        endcase
    end
        
//LD7:LD4) Current byte value
       
        
//BTN3) Addition              A <= A + B
//BTN2) Subtraction           A <= A - B
//BTN1) Multiplication        A <= A * B
//BTN0) Division              A <= A / B
//LD3G:LD0G) Selected operator {Addition, Subtraction, Multiplication, Division}
    assign ledG = btn;         

      
  /*  
   
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