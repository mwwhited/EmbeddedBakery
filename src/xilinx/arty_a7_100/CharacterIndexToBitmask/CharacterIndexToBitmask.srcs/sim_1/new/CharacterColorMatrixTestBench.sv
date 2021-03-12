`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 02:13:19 PM
// Design Name: 
// Module Name: CharacterColorMatrixTestBench
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

module CharacterColorMatrixTestBench;
    reg Write = 0;
    reg Clock = 0;
    reg Reset = 0;
    
    reg [2:0] VerticalOffset = 0;   
    /*
      1111  
      1  1  
      1  1  
     111111 
     1   11 
     1   11 
     1   11 
    */     
    reg [15:0] CharacterData = {4'h0, 4'hf, 8'h01};
    
    wire [3:0] Pixels [7:0];    
    
    CharacterColorMatrix characterColorMatrix(
        .Write(Write),
        .Clock(Clock),
        .Reset(Reset),
        .VerticalOffset(VerticalOffset),
        .CharacterData(CharacterData),
        .Pixels(Pixels)
    );
    
    always #1 begin
        Clock <= ~Clock;
    end
    
    int count = 0;
    always @(posedge Clock) begin    
        count <= count + 1;
        VerticalOffset <= count;    
        
        if (count == 24) begin
            $finish;
        end
    end

endmodule
