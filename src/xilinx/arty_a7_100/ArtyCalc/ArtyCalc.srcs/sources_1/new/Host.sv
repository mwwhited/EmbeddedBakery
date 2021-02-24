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
    
//SW3) Register selector (A = 0, B = 1)
//LD3R) Register selected
//SW2:SW0) Register byte selector
//LD2R:LDR0) Register  byte selcted
    assign ledR = sw;
      
    
    reg [31:0] registerA;
    reg [31:0] registerB;
    
    reg [31:0] registerR;
    reg [31:0] currentNibble;  
      
    assign currentRegister =
        sw[3] == 1 ?  registerA :
        sw[3] == 0 ?  registerB :
        32'bZ;
    
    NibbleWriter nibbleWriter(
        .dataIn(currentRegister),
        .index(sw[2:0]),
        .nibble(ledB),
        .dataOut(registerR)
    );
    
    NibbleReader(
        .data(registerR),
        .index(sw[2:0]),
        .nibble(led)
    );        
      
      /*  
    always @(ledB) begin
        if (sw[3]) begin
            registerA <= registerR;
        end else begin
            registerB <= registerR;
        end   
    end
    
    always @(sw) begin
        if (sw[3]) begin
            registerR <= registerA;
        end else begin
            registerR <= registerB;
        end  
    end
    */

        
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