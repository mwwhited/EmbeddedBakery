`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/12/2021 03:57:20 PM
// Design Name: 
// Module Name: ColorPaletteRom
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

module ColorPaletteRom #(
    parameter ColorIndexWidth = 4,
    parameter ColorBits = 12
) (
    input Write,
    input Clock,
    input Reset,
    
    input [(ColorIndexWidth - 1):0] ColorIndex,
    
    inout [(ColorBits - 1):0] ColorValue
);
    parameter Colors = 2 ** ColorIndexWidth;
    
    reg [(ColorBits - 1):0] paletteData [(Colors-1):0];
    wire [(ColorBits - 1):0] data;
    
    assign data = paletteData[ColorIndex];
    
    assign ColorValue = 
        Write ? {ColorBits{1'hZ}} : 
        data
        ;
        
    function void resetRam();
        //TODO: need to figure out how to make current working directory the project directory        
        $readmemb("C:/Repos/mwwhited/EmbeddedBakery/src/xilinx/arty_a7_100/CharacterIndexToBitmask/CharacterIndexToBitmask.srcs/sources_1/imports/fonts/colors.txt", paletteData);
    endfunction    
    
    initial begin
        resetRam();
    end    
    always @(posedge Reset) begin
        resetRam();
    end
    
    always @(posedge Clock) begin
        if (Write) begin
            paletteData[ColorIndex] <= ColorValue;
        end      
    end  

endmodule
