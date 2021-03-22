`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2021 08:41:04 AM
// Design Name: 
// Module Name: TextColorMux
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


module TextColorMux #(
    parameter TextBits = 8,
    parameter ColorBits = 4,
    
    parameter CharacterMaskWidth = 8,
    parameter CharacterMaskHeight = 8
) (
    input [(ColorBits - 1):0] BackgroundColor,
    input [(ColorBits - 1):0] ForegroundColor,
    input [(TextBits - 1):0] Text,
    
    input [($clog2(CharacterMaskHeight) - 1):0] VerticalOffset,
    
    output [(ColorBits - 1):0] Value [(TextBits - 1):0]
);
    wire [(CharacterMaskWidth - 1):0] _characterData;

    CharacterRom #(
        .CharacterIndexBits(TextBits),
        .CharacterMaskWidth(CharacterMaskWidth),
        .CharacterMaskHeight(CharacterMaskHeight)
    ) characterRom (
        .CharacterIndex(Text),
        .VerticalOffset(VerticalOffset),
        .CharacterData(_characterData)
    );
    
    wire _characterMapData [(CharacterMaskWidth - 1):0];
    assign _characterMapData = {<<{_characterData}};
    
    generate genvar ci;
        for (ci = 0; ci < CharacterMaskWidth; ci++) begin
            assign Value[ci] = _characterMapData[ci] ? ForegroundColor : BackgroundColor;
        end
    endgenerate 
    
endmodule
