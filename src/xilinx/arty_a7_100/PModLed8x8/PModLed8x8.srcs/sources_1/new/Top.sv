`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 10:13:54 AM
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
    input CLK100MHZ,
    input  [7:0] ps_ja,
    input  [7:0] ps_jb,
    output [0:7] ps_jc,
    output [0:7] ps_jd,
    
    output [3:0] led_r,
    output [3:0] led_g,
    output [3:0] led_b,
    output [3:0] led,
    input  [3:0] sw
    );
    
    logic [7:0] symbolA [7:0];
    logic [7:0] symbolB [7:0];
    
    initial begin
        symbolA[0] <= 7'b00111000;
        symbolA[1] <= 7'b01000100;
        symbolA[2] <= 7'b01010010;
        symbolA[3] <= 7'b01101010;
        symbolA[4] <= 7'b00110010;
        symbolA[5] <= 7'b00000100;
        symbolA[6] <= 7'b01111000;
        symbolA[7] <= 7'b00000000;
        
        symbolB[0] <= 7'b00111100;
        symbolB[1] <= 7'b00100100;
        symbolB[2] <= 7'b00100100;
        symbolB[3] <= 7'b01111110;
        symbolB[4] <= 7'b01100010;
        symbolB[5] <= 7'b01100010;
        symbolB[6] <= 7'b01100010;
        symbolB[7] <= 7'b00000000;       
    end
    
    logic [7:0] symbol [7:0];
    assign symbol = sw[0] ? symbolA : symbolB;
    
    int clockdivider = 0;
    int lineIndex = 0;
    
    logic [7:0] row = symbol[lineIndex];
    logic [7:0] col = ~(1 << lineIndex);
    
    logic [7:0] rm_row = {row[3],row[2],row[1],row[0], row[7],row[6],row[5],row[4]};
    logic [7:0] rm_col = {col[3],col[2],col[1],col[0], col[7],col[6],col[5],col[4]};
        
    assign ps_jc = sw[1] ? rm_row : row;
    assign ps_jd = sw[1] ? rm_col : col;

    always @(posedge CLK100MHZ) begin
        clockdivider <= clockdivider + 1;
        if (clockdivider == 10000) begin
            clockdivider <= 0;
            lineIndex <= (lineIndex + 1) % 8;
        end
    end
    
endmodule
