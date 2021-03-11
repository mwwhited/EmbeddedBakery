`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 07:53:08 AM
// Design Name: 
// Module Name: CharacterRomTestBench
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


module CharacterRomTestBench;
    reg Write = 0;
    reg Clock = 0;
    
    reg [7:0] CharacterIndex = 0;
    reg [2:0] VerticalOffset = 0;
    
    wire [7:0] CharacterData;
    
    CharacterRom crom(
        .Write(Write),
        .Clock(Clock),
        .CharacterIndex(CharacterIndex),
        .VerticalOffset(VerticalOffset),
        .CharacterData(CharacterData)
    );
    
    always #1 begin
        Clock = ~Clock;
    end 
    
    int index = 0;    
    always @(posedge Clock) begin
        index <= index + 1;  
        
        VerticalOffset <= index;
        CharacterIndex <= index >> 3;
        
        if (index == 256) begin
            $finish;
            index = 0;
        end        
    end

/*
module CharacterRom #(
    parameter CharacterIndexBits = 8,
    parameter CharacterMaskWidth = 8,
    parameter CharacterMaskHeight = 8
) (
    input Write,
    input Clock,
    
    input [(CharacterIndexBits - 1):0] CharacterIndex,
    input [(CharacterMaskHeightBits - 1):0] VerticalOffset,
    
    inout [(CharacterMaskWidth - 1):0] CharacterData
);
*/
endmodule
