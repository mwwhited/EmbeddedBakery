`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 06:23:15 PM
// Design Name: 
// Module Name: TextModeLineTestBench
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


module TextModeLineTestBench;
    parameter CharactersPerLine = 3;
    parameter CharacterIndexBits = 8;
    parameter CharacterMaskWidth = 8;
    parameter CharacterMaskHeight = 8;
    parameter ColorIndexWidth = 4;
    parameter ColorBits = 2;
    
    parameter CharacterDataWidth = ColorIndexWidth + ColorIndexWidth + CharacterIndexBits;
    parameter ColumnIndexWidth = $clog2(CharactersPerLine) + 1;
    parameter CharacterPixelWidth = $clog2(CharacterMaskWidth);
    parameter CharacterPixelHeight = $clog2(CharacterMaskHeight);
    parameter CharacterPixelTotal = CharacterMaskWidth * CharactersPerLine;
    
    reg Clock;        // Constant
    reg [(CharacterDataWidth - 1):0] Characters [(CharactersPerLine - 1):0];  // Text Line Buffer
    
    reg Reset;        // Async Reset
    reg Enable;       // High when Active
    
    wire CharacterLineCompletePulse;
    wire CharacterPixelLineCompletePulse;
    
    wire [(ColumnIndexWidth - 1):0] CharacterColumnIndex;    
    wire [(CharacterPixelWidth - 1):0] CharacterPixelX;
    wire [(CharacterPixelHeight - 1):0] CharacterPixelY;
    
    wire [(ColorBits - 1):0] PixelColor;
    
    TextModeLine #(
        .CharactersPerLine(CharactersPerLine),
        .ColorBits(ColorBits)
    ) uut(
        .Clock(Clock),
        .Characters(Characters),
        
        .ResetPixel(Reset),
        .Enable(Enable),
        
        .CharacterLineCompletePulse(CharacterLineCompletePulse),
        .CharacterPixelLineCompletePulse(CharacterPixelLineCompletePulse),
        
        .CharacterColumnIndex(CharacterColumnIndex),
        .CharacterPixelX(CharacterPixelX),
        .CharacterPixelY(CharacterPixelY),
        
        .PixelColor(PixelColor)
    ); 
    
    initial begin
        Clock <= 0;
        foreach(Characters[ci]) begin
            Characters[ci] <= { 4'h0, 4'hf, ci[7:0]};    
        end   
        Reset <= 0;
        Enable <= 0;      
    end   
    
    always #1 Clock <= ~Clock;
    
    int counter = 0;
    
    always @(posedge Clock) begin
        counter <= counter + 1;
        
        Reset <= 0;
        Enable <= 0;
        
        if (counter == 1) begin
            Reset <= 1;
        end else if (counter > 5) begin
            Enable <= 1;
        end        
    end 
    
    int line = 0;
    always @(posedge CharacterLineCompletePulse) begin
        line <= line + 1;        
        if (line > 10) begin        
            $finish;
        end        
    end
    
endmodule
