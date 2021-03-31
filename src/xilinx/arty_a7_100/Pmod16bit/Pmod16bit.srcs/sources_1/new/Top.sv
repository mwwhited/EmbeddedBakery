`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 12:07:27 AM
// Design Name: 
// Module Name: Top
// Project Name: 
// Target Devices: 
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


module Top(
    input [7:0]  ps_ja, 
    inout [7:0]  ps_jb,
    input [3:0]  sw,
    output [3:0] led 
    );
    
    assign ps_jb[3:0] = ps_ja[3:0];
    assign led = ps_jb[7:4];
    
endmodule
