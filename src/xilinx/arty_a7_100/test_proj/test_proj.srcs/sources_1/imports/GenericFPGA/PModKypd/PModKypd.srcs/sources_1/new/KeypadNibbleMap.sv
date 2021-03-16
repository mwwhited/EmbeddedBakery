`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/02/2021 11:28:47 PM
// Design Name: Keypad Mapper
// Module Name: KeypadNibbleMap
// Project Name: Arty Simple Calc
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module KeypadNibbleMap(
    input [3:0] Source,
    output [3:0] Mapped
    );
    
    assign Mapped = 
        Source == 4'b1111 ? 'h1 :
        Source == 4'b1011 ? 'h2 :
        Source == 4'b0111 ? 'h3 :
        Source == 4'b0011 ? 'hA :        
        Source == 4'b1110 ? 'h4 :
        Source == 4'b1010 ? 'h5 :
        Source == 4'b0110 ? 'h6 :
        Source == 4'b0010 ? 'hB :        
        Source == 4'b1101 ? 'h7 :
        Source == 4'b1001 ? 'h8 :
        Source == 4'b0101 ? 'h9 :
        Source == 4'b0001 ? 'hC :        
        Source == 4'b1100 ? 'h0 :
        Source == 4'b1000 ? 'hF :
        Source == 4'b0100 ? 'hE :
        Source == 4'b0000 ? 'hD :
        4'hZ;
    
endmodule
