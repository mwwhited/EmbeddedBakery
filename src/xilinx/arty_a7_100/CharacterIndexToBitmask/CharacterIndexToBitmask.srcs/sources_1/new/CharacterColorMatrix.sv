`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
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
    parameter ColorIndexWidth = 4, 
    parameter ColorBits = 12
) (
    input Write,
    input Clock,
    input Reset,
    
    input [(CharacterMaskHeightBits - 1):0] VerticalOffset,
    
    input [(CharacterDataWidth - 1):0] CharacterData,
    
    output [(ColorBits - 1):0] Pixels [(CharacterMaskWidth - 1):0]    
    );
    parameter CharacterDataWidth = ColorIndexWidth + ColorIndexWidth + CharacterIndexBits;
    parameter CharacterMaskHeightBits = $clog2(CharacterMaskHeight);
    parameter CharacterIndexes = 2 ** CharacterIndexBits;
    
    wire [(CharacterMaskWidth - 1):0] characterMap;
    wire [(CharacterIndexBits - 1):0] characterIndex;
    assign characterIndex = CharacterData[(CharacterMaskWidth - 1):0];
    
    wire [(ColorIndexWidth - 1):0] backgroundColor;
    wire [(ColorIndexWidth - 1):0] foregroundColor;
    assign backgroundColor = CharacterData[(ColorIndexWidth - 1 + (ColorIndexWidth + CharacterMaskWidth)):0 + (ColorIndexWidth + CharacterMaskWidth)];
    assign foregroundColor = CharacterData[(ColorIndexWidth - 1 + (CharacterMaskWidth)):0 + (CharacterMaskWidth)];
        
    CharacterRom #(
        .CharacterIndexBits(CharacterIndexBits),
        .CharacterMaskWidth(CharacterMaskWidth),
        .CharacterMaskHeight(CharacterMaskHeight)
    ) characterRom (
        //.Write(Write),
        //.Reset(Reset),
        .Write(0),
        .Reset(0),
        .Clock(Clock),
        .CharacterIndex(characterIndex),
        .VerticalOffset(VerticalOffset),
        .CharacterData(characterMap)
    );
        
    wire [(ColorIndexWidth - 1):0] colorIndexes [(CharacterMaskWidth - 1):0]  ;
    generate genvar p;
        for(p = 0; p < CharacterMaskWidth; p++) begin
        
            assign colorIndexes[p] = characterMap[p] ? foregroundColor : backgroundColor;
            
            ColorPaletteRom #(
                .ColorIndexWidth(ColorIndexWidth),
                .ColorBits(ColorBits)
            ) i_ColorPaletteRom(
                // .Write(Write),
                // .Reset(Reset),
                .Write(0),
                .Reset(0),
                .Clock(Clock),
                .ColorIndex(colorIndexes[p]),
                .ColorValue(Pixels[p])
            );
            
            //assign Pixels[p] = characterMap[p] ? foregroundColor : backgroundColor;
            
            
        end        
    endgenerate 
    
endmodule
