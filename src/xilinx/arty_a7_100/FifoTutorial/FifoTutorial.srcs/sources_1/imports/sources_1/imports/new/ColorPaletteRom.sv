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
    input [(ColorIndexWidth - 1):0] ColorIndex,
    
    output [(ColorBits - 1):0] ColorValue
);
    parameter Colors = 2 ** ColorIndexWidth;
    
    reg [(ColorBits - 1):0] paletteData [(Colors-1):0];
        
    assign ColorValue = paletteData[ColorIndex];
        
    function void resetRam();
        //TODO: need to figure out how to make current working directory the project directory        
        $readmemb("FifoTutorial.srcs/sources_1/imports/fonts/colors.txt", paletteData);
    endfunction    
    
    initial begin
        resetRam();
    end 

endmodule
