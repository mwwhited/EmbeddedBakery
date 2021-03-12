`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development
// Engineer: Matthew Whited
// 
// Create Date: 03/12/2021 04:19:49 PM
// Design Name: 
// Module Name: ColorPaletteRomTestBench
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


module ColorPaletteRomTestBench;

        reg Write = 0;
        reg Clock = 0;
        reg Reset = 0;
        
        reg [3:0] ColorIndex;        
        wire [11:0] ColorValue;
        
        ColorPaletteRom colorPaletteRom(
            .Write(Write),
            .Clock(Clock),
            .Reset(Reset),
            .ColorIndex(ColorIndex),
            .ColorValue(ColorValue)
        );
        
        always #1 begin
            Clock <= ~Clock;
        end
        
        int counter = 0;
        
        always @(posedge Clock) begin
            ColorIndex <= counter;
            counter <= counter + 1;
            if (counter == 16) begin
                $finish; 
            end
        end
        
    /*
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
    */
    
endmodule
