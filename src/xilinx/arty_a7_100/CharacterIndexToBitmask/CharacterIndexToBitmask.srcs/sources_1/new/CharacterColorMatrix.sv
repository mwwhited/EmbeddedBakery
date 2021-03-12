`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 01:53:16 PM
// Design Name: 
// Module Name: CharacterColorMatrix
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

module CharacterColorMatrix #(
    parameter CharacterIndexBits = 8,
    parameter CharacterMaskWidth = 8,
    parameter CharacterMaskHeight = 8,
    parameter ColorBits = 4
) (
    input Write,
    input Clock,
    input Reset,
    
    input [(CharacterMaskHeightBits - 1):0] VerticalOffset,
    
    input [(CharacterDataWidth - 1):0] CharacterData,
    
    output reg [(ColorBits - 1):0] Pixels [(CharacterMaskWidth - 1):0]    
    );
    parameter CharacterDataWidth = ColorBits + ColorBits + CharacterIndexBits;
    parameter CharacterMaskHeightBits = $clog2(CharacterMaskHeight);
    parameter CharacterIndexes = 2 ** CharacterIndexBits;
    
    wire [(CharacterMaskWidth - 1):0] characterMap;
    wire [(CharacterIndexBits - 1):0] characterIndex;
    assign characterIndex = CharacterData[(CharacterMaskWidth - 1):0];
    
    wire [(ColorBits - 1):0] backgroundColor;
    wire [(ColorBits - 1):0] foregroundColor;
    assign backgroundColor = CharacterData[(ColorBits - 1 + (ColorBits + CharacterMaskWidth)):0 + (ColorBits + CharacterMaskWidth)];
    assign foregroundColor = CharacterData[(ColorBits - 1 + (CharacterMaskWidth)):0 + (CharacterMaskWidth)];
    
    CharacterRom #(
        .CharacterIndexBits(CharacterIndexBits),
        .CharacterMaskWidth(CharacterMaskWidth),
        .CharacterMaskHeight(CharacterMaskHeight)
    ) characterRom (
        .Write(Write),
        .Clock(Clock),
        .Reset(Reset),
        .CharacterIndex(characterIndex),
        .VerticalOffset(VerticalOffset),
        .CharacterData(characterMap)
    );
        
    always @(posedge Clock) begin    
        for(int p = 0; p < CharacterMaskWidth; p++) begin
            Pixels[p] <= characterMap[p] ? foregroundColor : backgroundColor;
        end        
    end  
endmodule
