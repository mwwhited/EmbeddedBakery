`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/11/2021 06:07:51 AM
// Design Name: 
// Module Name: CharacterRom
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
    parameter CharacterMaskHeightBits = $clog2(CharacterMaskHeight);
    //parameter CharacterIndexDepth = 2 ** CharacterIndexBits;
    //parameter MaskWidth = CharacterMaskWidth * CharacterMaskHeight;
    parameter MaskAddressWidth = CharacterMaskHeightBits + CharacterIndexBits ;
    
    reg [(CharacterMaskWidth - 1):0] maskData [(MaskAddressWidth - 1):0];
    reg [(CharacterMaskWidth - 1):0] mask;
    wire [(MaskAddressWidth - 1):0] maskIndex;
    
    assign maskIndex = {CharacterIndex, VerticalOffset};
    assign CharacterData = Write ? {CharacterMaskWidth{1'hZ}} : mask;
    
    initial begin
        $readmemb("C:/Repos/mwwhited/EmbeddedBakery/src/xilinx/arty_a7_100/CharacterIndexToBitmask/CharacterIndexToBitmask.srcs/sources_1/imports/fonts/font.txt", maskData);
    end
    
    always @(posedge Clock) begin
        mask <=  maskData[maskIndex];
    end
    
    always @(negedge Clock) begin
        if (Write) begin
            maskData[maskIndex] <= CharacterData;
        end  
    end    
    
endmodule
