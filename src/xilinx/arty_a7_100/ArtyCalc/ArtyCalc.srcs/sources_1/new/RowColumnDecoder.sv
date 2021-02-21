`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 02/21/2021 07:54:28 AM
// Design Name: Row x Column Decoder
// Module Name: RowColumnDecoder
// Project Name: Simple Arty Calculator
// Target Devices: Digilent Arty A7-100
// Tool Versions: 
// Description: Simple Row/Column matrix decoder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RowColumnDecoder(
    input clock,
    input [3:0] row,
    output reg [3:0] column,
    output reg [3:0] result,
    
    output sequenceClock,
    output columnDelay
    );
    
    bit sequenceClock;
    bit columnDelay;
    reg [1:0] columnCounter; 
    
    ClockDivider clockDivider(
        .clockIn(clock),
        .clockOut(sequenceClock)
    );
    
    // delay clock
    always #100 columnDelay = sequenceClock;
    
     // write column
    always @(posedge sequenceClock)
    begin
        case (column)
            4'b0111 : column <= 4'b1011;
            4'b1011 : column <= 4'b1101;
            4'b1101 : column <= 4'b1110;
            default : column <= 4'b0111; 
        endcase
    end
    
    // read row
    always @(posedge columnDelay)
    begin
        case({column, row})
            8'b0111_0111: result <= 'h1;
            8'b0111_1011: result <= 'h4;
            8'b0111_1101: result <= 'h7;
            8'b0111_1110: result <= 'h0;
            
            8'b1011_0111: result <= 'h2;
            8'b1011_1011: result <= 'h5;
            8'b1011_1101: result <= 'h8;
            8'b1011_1110: result <= 'hF;
            
            8'b0111_0111: result <= 'h3;
            8'b0111_1011: result <= 'h6;
            8'b0111_1101: result <= 'h9;
            8'b0111_1110: result <= 'hE;
            
            8'b1011_0111: result <= 'hA;
            8'b1011_1011: result <= 'hB;
            8'b1011_1101: result <= 'hC;
            8'b1011_1110: result <= 'hD;
        endcase
    end
    
endmodule
