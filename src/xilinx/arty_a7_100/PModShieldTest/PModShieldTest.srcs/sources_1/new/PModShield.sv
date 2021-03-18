`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 01:20:15 PM
// Design Name: 
// Module Name: PModShield
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


module PModShield(
    input CLK100MHZ,
    output [7:0] ps_ja,
    output [7:0] ps_jb,
    output [7:0] ps_jc,
    output [7:0] ps_jd,
    output [7:0] ps_je
    );
    
    logic dividedClock;
    
    ClockDivider_0 ClockDivider(
        .SystemClock(CLK100MHZ),
        .DividedClock(dividedClock)
    ); 
    
    int counter = 0;
    
    assign ps_je = counter[7:0];
    
    always @(posedge dividedClock) begin
        counter++;
    end    
    
endmodule
