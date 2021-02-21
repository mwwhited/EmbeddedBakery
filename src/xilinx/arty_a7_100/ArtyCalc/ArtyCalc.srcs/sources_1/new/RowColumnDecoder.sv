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
    output reg [3:0] result    
    );
    
    reg sequenceClock;
    reg sequenceClockOneShot;
    reg [7:0] delayCounter;
    
    initial
    begin
        result = 4'bZ;
        column = 4'b0111;         
    end
    
    ClockDivider clockDivider(
        .clockIn(clock),
        .clockOut(sequenceClock)
    );
        
    always @(posedge clock)
    begin
        if (sequenceClock)
        begin        
            if (sequenceClockOneShot == 0)
            begin
                // write column
                case (column)
                    4'b0111 : column <= 4'b1011;
                    4'b1011 : column <= 4'b1101;
                    4'b1101 : column <= 4'b1110;
                    4'b1110 : column <= 4'b0111;
                    default : column <= 4'b0111; 
                endcase
                sequenceClockOneShot <= 1;                
            end else if(delayCounter == 8) begin
            
                // read row
                case({column, row})
                    8'b0111_0111: result <= 'h1;
                    8'b0111_1011: result <= 'h4;
                    8'b0111_1101: result <= 'h7;
                    8'b0111_1110: result <= 'h0;
                    
                    8'b1011_0111: result <= 'h2;
                    8'b1011_1011: result <= 'h5;
                    8'b1011_1101: result <= 'h8;
                    8'b1011_1110: result <= 'hF;
                    
                    8'b1101_0111: result <= 'h3;
                    8'b1101_1011: result <= 'h6;
                    8'b1101_1101: result <= 'h9;
                    8'b1101_1110: result <= 'hE;
                    
                    8'b1110_0111: result <= 'hA;
                    8'b1110_1011: result <= 'hB;
                    8'b1110_1101: result <= 'hC;
                    8'b1110_1110: result <= 'hD;
                endcase
            end else begin
                delayCounter = delayCounter + 1;
            end                        
        end else begin
            sequenceClockOneShot <= 0;
            delayCounter <= 0;
        end       
    end    
endmodule
