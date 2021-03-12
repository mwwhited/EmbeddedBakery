`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/11/2021 06:07:51 AM
// Design Name: Character RAM / ROM
// Module Name: CharacterRom
// Project Name: 
// Target Devices: Digilent Arty A7 100t - Xilinx Atrix 7 100t 
// Description: Reconfigurable Character ROM
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module CharacterRom #(
    parameter CharacterIndexBits = 8,
    parameter CharacterMaskWidth = 8,
    parameter CharacterMaskHeight = 8
) (
    input Write,
    input Clock,
    input Reset,
    
    input [(CharacterIndexBits - 1):0] CharacterIndex,
    input [(CharacterMaskHeightBits - 1):0] VerticalOffset,
    
    inout [(CharacterMaskWidth - 1):0] CharacterData
);
    parameter CharacterMaskHeightBits = $clog2(CharacterMaskHeight);
    parameter CharacterIndexes = 2 ** CharacterIndexBits;
    
    reg [(CharacterMaskWidth - 1):0] maskData [(CharacterIndexes - 1):0][(CharacterMaskHeight - 1):0];
    wire [(CharacterMaskWidth - 1):0] mask;
    
    assign mask = maskData[CharacterIndex][VerticalOffset];
    
    assign CharacterData = 
        Write ? {CharacterMaskWidth{1'hZ}} : 
        mask
        ;
    
    initial begin
        $readmemb("C:/Repos/mwwhited/EmbeddedBakery/src/xilinx/arty_a7_100/CharacterIndexToBitmask/CharacterIndexToBitmask.srcs/sources_1/imports/fonts/font.txt", maskData);
    end    
    always @(posedge Reset) begin
        //TODO: need to figure out how to make current working directory the project directory        
        $readmemb("C:/Repos/mwwhited/EmbeddedBakery/src/xilinx/arty_a7_100/CharacterIndexToBitmask/CharacterIndexToBitmask.srcs/sources_1/imports/fonts/font.txt", maskData);
    end
    
    always @(posedge Clock) begin
        if (Write) begin
            maskData[CharacterIndex][VerticalOffset] <= CharacterData;
        end      
    end    
    
endmodule
