`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Out-of-Band Development 
// Engineer: Matthew Whited
// 
// Create Date: 03/03/2021 07:27:23 PM
// Design Name: 
// Module Name: VgaController
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


module TextModeController #(
    parameter FrameWidth = 1920,
    parameter FrameHeight = 1080, 
    
    parameter HfpPixels = 88,       //H front porch width (pixels)
    parameter HpwPixels = 44,       //H sync pulse width (pixels)
    parameter HMaxPixels = 2200,    //H total period (pixels)
    parameter HPolarization = 1,         
    
    parameter VfpLines = 4,         //V front porch width (lines)
    parameter VpwLines = 5,         //V sync pulse width (lines)
    parameter VMaxLines = 1125,     //V total period (lines)
    parameter VPolarization = 1,
    
    parameter CharacterColumns = 60, // 80,
    parameter CharacterLines = 33, // 45,
    parameter CharacterPixelHeight = 8,
    parameter CharacterPixelWidth = 8,
    
    parameter HCounterWidth = $clog2(HMaxPixels),
    parameter VCounterWidth = $clog2(VMaxLines)
)(
    input ScanClock, //148.5 MHz for 1920x1080
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue,
    
    output reg HorizontalSync,
    output reg VerticalSync,
    
    output reg LineComplete,
    output reg FrameComplete,
    output reg LineBlanking,
    output reg FrameBlanking,
    
    input [15:0] CharacterBuffer [(CharacterColumns * CharacterLines)-1:0], // 15:12 BgC, 11:8 FgC, 7:0 Char
    input [11:0] ColorPalette [15:0], // RRRR GGGG BBBB
    input [(CharacterPixelHeight * CharacterPixelWidth - 1):0] CharacterMap [255:0] // CharacterPixelHeight x CharacterPixelWidth pixels
);
    reg [HCounterWidth:0] hCounter;
    reg [VCounterWidth:0] vCounter;
    
    initial begin
        hCounter <= 0;
        vCounter <= 0;
    end
    
    wire characterSubPixel;
    
    int realX, realY;
    int characterX, characterY;
    int characterIndex;
    int subPixel, subLine; 
       
    assign realX = hCounter / 4;
    assign realY = vCounter / 4;   
     
    assign characterX = realX / CharacterPixelWidth % CharacterColumns;
    assign characterY = realY / CharacterPixelHeight;    
    assign characterIndex = characterY * CharacterColumns + characterX;
    assign subPixel = realX % CharacterPixelWidth + 1;
    assign subLine = realY % CharacterPixelHeight + 1;

    // Get character from buffer
    wire [3:0] foreground;
    wire [3:0] background;
    wire [15:0] characterBufferSelected;
    wire [7:0] characterSelected;
    assign characterBufferSelected = CharacterBuffer[characterIndex];
    assign background = (characterBufferSelected >> 12 & 4'hf);
    assign foreground = (characterBufferSelected >> 8 & 4'hf);
    assign characterSelected = (characterBufferSelected & 8'hff);
    
     // Get charcter data from character map
    wire [(CharacterPixelHeight * CharacterPixelWidth - 1):0] characterMapped;
    wire [7:0] characterMapLine;
    wire characterSubPixel;
    assign characterMapped = CharacterMap[characterSelected];
    assign characterMapLine = (characterMapped >> (CharacterPixelHeight - subLine) * CharacterPixelWidth) & 8'hff;
    assign characterSubPixel = (characterMapLine >> (CharacterPixelWidth - subPixel) & 1'b1);
    
    // Get actual colors from palette
    wire [11:0] color;
    assign color = ColorPalette[characterSubPixel ? foreground : background];     

    always @(posedge ScanClock) begin    
    
        //$display("%h, %h => %h, %h :: %h", realX, realY, characterX, characterY, vCounter);
        //$display("%h, %h :: %h", characterX, characterY, characterIndex);
        //$display("%h, %h :: %h", subPixel, subLine, characterBufferSelected);
        //$display("%h, %h, %h", background, foreground, characterSelected);
        //$display("%h, %h", characterMapped, characterSelected);
    
        Red <= 4'b0;
        Green <= 4'b0;
        Blue <= 4'b0;    
        
        HorizontalSync <= 1'b0;
        VerticalSync <= 1'b0;
        
        LineComplete <= 1'b0;
        FrameComplete <= 1'b0;
        LineBlanking <= 1'b0;
        FrameBlanking <= 1'b0;
    
        hCounter <= hCounter + 1;
        if (hCounter < FrameWidth) begin
            // Horizontal Display Period
        end else begin
            // Horizontal Blanking Period   
            LineBlanking <=  1'b1;    
                      
            if (hCounter > FrameWidth + HfpPixels && 
                hCounter < FrameWidth + HfpPixels + HpwPixels) begin
                HorizontalSync <=  1'b1;
            end  
            if (hCounter == HMaxPixels) begin
                hCounter <= -1;
                vCounter <= vCounter + 1;
                LineComplete <= ~LineComplete;
            end
        end
        
        if (vCounter < FrameHeight) begin
            // Vertical Display Period
        end else begin
            // Vertical Blanking Period   
            FrameBlanking <= 1'b1;        
            if (vCounter > FrameHeight + VfpLines && 
                vCounter < FrameHeight + VfpLines + VpwLines) begin
                HorizontalSync <=  1'b1;
            end   
            if (vCounter == VMaxLines) begin                
                vCounter <= -1;
                FrameComplete <= ~FrameComplete;
            end       
        end 
         
        if (
            ~LineBlanking && ~FrameBlanking
            && CharacterColumns * CharacterPixelWidth * 4 > hCounter
            && CharacterLines * CharacterPixelHeight * 4 > vCounter
            ) begin        
            //Draw Pixels
            
            // {Red, Green, Blue} <= vCounter *  FrameWidth + hCounter;
            {Red, Green, Blue} <= color;
        end      
    end
    
endmodule
